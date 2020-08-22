package com.my.ERP.Human.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.ERP.Human.model.service.HumanService;

@Controller
public class HumanController {
	
	@Autowired
	private HumanService hService;
	
	// 인사기본관리
	@RequestMapping("humanManager")
	public String humanMain() {
		
		return "humanManager";
	}
	
	// 급여관리
	@RequestMapping("salaryManager")
	public String salaryMain() {
		return "salaryManager";
	}
	
	// 휴가관리
	@RequestMapping("vacationManager")
	public String vacationMain() {
		return "vacationManager";
	}
	
	// 직급관리
	@RequestMapping("positionManager")
	public String positionMain() {
		return "positionManager";
	}
	
	// 마이페이지
	@RequestMapping("myInfo")
	public String myinfoMain() {
		return "myInfo";
	}
	
	// 부서관리
	@RequestMapping("departmentManager")
	public String departmentMain() {
		return "departmentManager";
	}
	
}
