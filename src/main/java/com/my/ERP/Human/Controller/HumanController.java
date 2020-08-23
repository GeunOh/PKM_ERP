package com.my.ERP.Human.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	public String positionMain(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page!=null) currentPage = page;
		
		int listCount = hService.postionListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Human> pList = hService.positionList(pi);
		model.addAttribute("pList",pList).addAttribute("pi",pi);
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
	
	// 사원관리 검색
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
	
	// 직급 검색
	@RequestMapping("searchPosition")
	public String searchPosition(@RequestParam(value="page", required = false) Integer page, Model model,
								 @RequestParam("name") String name) {
		
		int currentPage = 1;
		
		if(page != null) currentPage = page;

		int listCount = hService.searchPositionCount(name);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Human> pList = hService.searchPosition(name, pi);
		model.addAttribute("pList", pList)
			 .addAttribute("pi", pi);
		
		
		
		return "positionManager";
	}
	
	
	// 부서 등록 기능
	@RequestMapping("addDept")
	public String addDept(HttpServletRequest request) {
		
		Department dept = new Department();
		dept.setDcode(request.getParameter("dcode"));
		dept.setDname(request.getParameter("dname"));
		dept.setDcomment(request.getParameter("dcomment"));
		dept.setEno(request.getParameter("ename")); // eno 이지만 직원의 이름을 가지고있음
		
		hService.addDept(dept);
		
		return "redirect:/Human/departmentManager";
	}
	
	// 부서 삭제 기능
	@RequestMapping("delDept")
	public String delDept(@RequestParam("dname") String[] dnames) {
		
		hService.delDept(dnames);
		
		return "redirect:/Human/departmentManager";
	}
	
	// 부서 정보 수정 기능
	@RequestMapping("modifyDept")
	public String modifyDept(HttpServletRequest request) {
		
		String beforeDeptName = request.getParameter("beforeDept");
		
		Department dept = new Department();
		dept.setDcode(request.getParameter("dcode"));
		dept.setDname(request.getParameter("dname"));
		dept.setDcomment(request.getParameter("dcomment"));
		dept.setEno(request.getParameter("ename")); // eno 이지만 직원의 이름을 가지고있음
		dept.setStartDate(request.getParameter("startDate"));
		
		hService.modifyDept(dept, beforeDeptName);
		
		return "redirect:/Human/departmentManager";
	}
	
}
