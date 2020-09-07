package com.my.ERP;

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
}
