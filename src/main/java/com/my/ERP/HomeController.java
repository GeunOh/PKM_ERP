package com.my.ERP;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.email.Email;
import com.my.ERP.common.email.EmailSender;

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
	
	// 이메일
	@Autowired
	private EmailSender emailSender;
	@Autowired
    private Email email;
	
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
		System.out.println(loginUser);
		response.setContentType("text/html; charset=UTF-8");

		if(loginUser != null) {
			
			if(passwordEncoder.matches(pwd, loginUser.getPwd())) {
				
				Cookie c = new Cookie("saveId", id);
				if(saveId != null){
					c.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(c);
				}else {
					c.setMaxAge(0);
					response.addCookie(c);
				}
				
				//로그인 정보가 있을 시, 관리자는 퀵메뉴, 일반사용자는 개인페이지로
				if(loginUser.getAdminyn().equals("N")) {
					model.addAttribute("loginUser", loginUser);
					return "human/myInfo";
				}else {
					model.addAttribute("loginUser", loginUser);
					return "QuickMenu";
				}
				
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
	
	// 아이디 찾기
	@RequestMapping("idFind")
	@ResponseBody
	public String idFind(@RequestParam("ename") String ename, @RequestParam("phone") String phone) throws Exception {

		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("ename", ename);
		hs.put("phone", phone);

		Human findHuman = hService.idFind(hs);
		if(findHuman == null) {
			return "fail";
		} else {
			String receiver = findHuman.getEmail();
			email.setReceiver(receiver);
			email.setSubject("[WORKSPACE] " + ename + "님의 아이디입니다.");
			email.setContent("[WORKSPACE]  " + ename + "님의 사원번호(아이디)는 [" + findHuman.getEno() + "] 입니다.");
			emailSender.SendEmail(email);
			return "success";
		}
	}

	// 비밀번호 찾기
	@RequestMapping("pwdFind")
	@ResponseBody
	public String pwdFind(@RequestParam("id") String id, @RequestParam("ename") String ename,
						  @RequestParam("phone") String phone) throws Exception {
		// UI단에서 받아온 입력값을 HashMap 객체에 저장
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("ename", ename);
		hs.put("id", id);
		hs.put("phone", phone);
		
		// 실제 존재하는 사용자인지 확인
		Human findHuman = hService.pwdFind(hs);
		if(findHuman == null) {	// 존재하지 않는다면 "fail" 문자열 반환
			return "fail";
		} else {
			// 임시비밀번호로 초기화하기 위해 휴대전화번호를 가져옴
			String getPhone = findHuman.getPhone();
			// 가져온 휴대전화 끝 4자리를 추출
			String lastPhone = getPhone.substring(getPhone.length()-4, getPhone.length());
			// 사원번호 + 휴대전화 끝 4자리로 임시비밀번호 완성
			String tempPwd = findHuman.getEno() + lastPhone;
			// 임시비밀번호 문자열 인코딩 후 HashMap 객체에 추가
			String encTempPwd = passwordEncoder.encode(tempPwd);
			hs.put("encTempPwd", encTempPwd);

			// 비밀번호 임시비밀번호로 변경
			int result = hService.tempPwd(hs);
			
			// 수신자의 이메일과 제목, 내용을 지정 후 발송
			String receiver = findHuman.getEmail();
			// 이메일 객체에 값을 지정
			email.setReceiver(receiver);
			email.setSubject("[WORKSPACE] " + ename + "님의 비밀번호입니다.");
			email.setContent("[WORKSPACE] " + ename + "님의 임시비밀번호는 [" + tempPwd  + "] 입니다.\n"
							 + "로그인 후 비밀번호를 재설정 해주세요.");
			// 이메일을 전송해주는 역할을 하는 객체의 메서드 호출
			emailSender.SendEmail(email);
			return "success";
		}
	}
	// 퀵메뉴
	@RequestMapping("quickMenu")
	public String quickMenu() {
		return "QuickMenu";
	}
}
