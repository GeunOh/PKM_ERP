package com.my.ERP.Human;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HumanController {
	
	// 인사기본관리
	@RequestMapping("HumanManager")
	public String HumanMain() {
		return "HumanManager";
	}
	
	// 급여관리
	@RequestMapping("SalaryManager")
	public String SalaryMain() {
		return "SalaryManager";
	}
}
