package com.my.ERP.Human.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

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
	
	// 부서관리
	@RequestMapping("departmentManager")
	public String departmentMain(Model model) {
		
		// 부서조회
		ArrayList<Department> deptList = hService.showDepartment();
//		System.out.println(deptList);
		model.addAttribute("deptList", deptList);
		return "departmentManager";
	}
	
	//사원관리 검색
	@RequestMapping("SearchHuman")
	public String SearchHuman(@RequestParam(value="page", required = false) Integer page, Model model,
							  @RequestParam("selectVal") String selectVal
			
			) {
		int currentPage = 1;
		
		if(page != null) currentPage = page;
		
		SearchOption so = new SearchOption();
		
		if(selectVal.equals("all")) {
			so.setAll("Y");
		}else if(selectVal.equals("in")) {
			so.setInUser("Y");
		}else {
			so.setOutUser("Y");
		}
		
		int listCount = hService.SearchHumanListCount(so);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Human> hList = hService.SearchHumanList(pi, so);
		
		model.addAttribute("pi", pi)
	         .addAttribute("hList", hList)
	         .addAttribute("selectVal", selectVal);
	         
		
		
		return "humanManager";
	}
	
}
