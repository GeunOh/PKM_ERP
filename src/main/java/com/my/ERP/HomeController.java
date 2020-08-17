package com.my.ERP;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("LoginForm")
	public String LoginForm() {
		
		return "LoginForm";
	}
	
	public String lo() {
		return " ";
	}
	

	public String sanghoo() {
		
		return "LoginForm";
	}

}
