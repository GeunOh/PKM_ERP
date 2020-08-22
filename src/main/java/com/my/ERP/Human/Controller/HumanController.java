package com.my.ERP.Human.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;

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
	public String departmentMain(Model model) {
		
		// 부서조회
		ArrayList<Department> deptList = hService.showDepartment();
//		System.out.println(deptList);
		model.addAttribute("deptList", deptList);
		return "departmentManager";
	}
	
}
