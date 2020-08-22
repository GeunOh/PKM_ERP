package com.my.ERP.Human.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;

@Controller
public class HumanController {
	
	@Autowired
	private HumanService hService;
	
	// 인사기본관리
	@RequestMapping("humanManager")
	public String humanMain(@RequestParam(value="page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = hService.HumanListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Human> hList = hService.HumanList(pi);

		model.addAttribute("pi", pi)
		     .addAttribute("hList", hList);
		
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
	
	// 부서관리페이지 이동
	@RequestMapping("departmentManager")
	public String departmentMain(Model model) {
		
		// 부서 목록 조회
		ArrayList<Department> deptList = hService.showDepartmentList();
		model.addAttribute("deptList", deptList);
		
		return "departmentManager";
	}
	
	// 부서관리페이지 - 각 부서 정보 조회
	@RequestMapping("departmentShow")
	@ResponseBody
	public Department departmentShow(@RequestParam("deptName") String deptName, Model model) {
		System.out.println(deptName);
		
		// 해당 부서 조회
		Department dept = hService.showDepartment(deptName);
		System.out.println(dept);
		return dept;
	}
	
	
	
	
}
