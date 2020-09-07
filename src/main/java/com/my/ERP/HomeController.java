package com.my.ERP;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Human;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class HomeController {
	
	@Autowired
	private HumanService hService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("LoginForm")
	public String LoginForm(@CookieValue(value="saveId", required=false) Cookie saveId, Model model, HttpServletRequest request) {
		model.addAttribute("saveId", saveId);
		return "LoginForm";
	}
	
	@RequestMapping("Login")
	public String Login(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
						@RequestParam(value="idChk", required=false) String saveId, Model model,
						HttpServletResponse response, RedirectAttributes ra) throws Exception {
		
		Human loginUser = hService.Login(id);
		
		response.setContentType("text/html; charset=UTF-8");

		if(loginUser != null) {
			
			if(passwordEncoder.matches(pwd, loginUser.getPwd())) {
				
				Cookie c = new Cookie("saveId", id);
				if(saveId != null){
					c.setMaxAge(60 * 60 * 24 * 30);
					response.addCookie(c);
				}else {
					c.setMaxAge(0);
					response.addCookie(c);
				}
				
				model.addAttribute("loginUser", loginUser);
				return "QuickMenu";
			}else {
				ra.addFlashAttribute("pwdFalse", "pwdFalse");
			}
			
		}else {
			ra.addFlashAttribute("idFalse", "idFalse");
		}
		
		return "redirect:/LoginForm";
	}
	
	@RequestMapping("Logout")
	public String Logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/LoginForm";
	}
	
	@RequestMapping("idFind")
	@ResponseBody
	public String idFind(@RequestParam("ename") String ename, @RequestParam("phone") String phone) {

		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("ename", ename);
		hs.put("phone", phone);
		
		Human findHuman = hService.idFind(hs);
		if(findHuman == null) {
			return "fail";
		} else {
			String setfrom = "sanghoo96@naver.com";
			String tomail = findHuman.getEmail(); // 받는 사람 이메일
			String title = "[WORKSPACE] " + ename + "님의 아이디입니다."; // 제목
			String content = "[WORKSPACE]  " + ename + "님의 사원번호(아이디)는 [" + findHuman.getEno() + "] 입니다."; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return "success";
	}
	
	// 비밀번호 찾기
	@RequestMapping("pwdFind")
	@ResponseBody
	public String pwdFind(@RequestParam("id") String id, @RequestParam("ename") String ename,
						  @RequestParam("phone") String phone) {

		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("ename", ename);
		hs.put("id", id);
		hs.put("phone", phone);

		Human findHuman = hService.pwdFind(hs);
		System.out.println(findHuman);
		if(findHuman == null) {
			return "fail";
		} else {
			// 랜덤 비밀번호(문자열+숫자 혼용 10자리)
			StringBuffer tempPwd = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			    	tempPwd.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			    	tempPwd.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			    	tempPwd.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			// 임시비밀번호 문자열 인코딩
			String encTempPwd = passwordEncoder.encode(tempPwd);
			hs.put("encTempPwd", encTempPwd);
			
			// 비밀번호 임시비밀번호로 변경
			int result = hService.tempPwd(hs);
			
			
			String setfrom = "sanghoo96@naver.com";
			String tomail = findHuman.getEmail(); // 받는 사람 이메일
			String title = "[WORKSPACE] " + ename + "님의 임시비밀번호입니다."; // 제목
			String content = "[WORKSPACE]  " + ename + "님의 임시비밀번호는 [" + tempPwd + "] 입니다.\n"
							 + "로그인 후 비밀번호 재설정을 해주세요."; // 내용

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}
			
			return "success";
		}
	}
	
}
