package com.my.ERP.Human.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

@Controller
public class HumanController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;

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
	public String positionMain(Model model) {
		
		ArrayList<Rank> pList = hService.positionList();
		model.addAttribute("pList",pList);
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
		// 해당 부서 조회
		Department dept = hService.showDepartment(deptName);
		return dept;
	}
	
	// 사원관리 검색
	@RequestMapping("SearchHuman")
	public String SearchHuman(@RequestParam(value="page", required = false) Integer page, Model model,
							  @RequestParam("selectVal") String selectVal, @RequestParam("selectDept") String selectDept,
							  @RequestParam("selectRank") String selectRank, @RequestParam("email") String email,
							  @RequestParam("eno") String eno, @RequestParam("name") String name,
							  @RequestParam("selectDate") String selectDate,
							  @RequestParam(value="date", required = false) Date date,
							  @RequestParam(value="date2", required = false) Date date2
			) {
		System.out.println(name);
		int currentPage = 1;
		
		if(page != null) currentPage = page;
		
		SearchOption so = new SearchOption();
		
		if(selectVal.equals("all")) {
			so.setAll("all");
		}else if(selectVal.equals("in")) {
			so.setInUser("in");
		}else if(selectVal.equals("out")){
			so.setOutUser("out");
		}
		
		if(selectDate.equals("dateAll")) {
			so.setDateAll("dateAll");
		}else if(selectDate.equals("dateSelect")){
			so.setDateSelect("dateSelect");
		}
		
		System.out.println(so);
		HashMap<String, Object> hs = new HashMap<>();
		hs.put("so",so);
		hs.put("dept",selectDept);
		hs.put("rank",selectRank);
		hs.put("email",email);
		hs.put("eno",eno);
		hs.put("name",name);
		hs.put("date",date);
		hs.put("date2",date2);
		
		
		int listCount = hService.SearchHumanListCount(hs);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Human> hList = hService.SearchHumanList(pi, hs);
		
		model.addAttribute("pi", pi)
	         .addAttribute("hList", hList)
	         .addAttribute("selectVal", selectVal)
	         .addAttribute("selectDate", selectDate)
	         .addAttribute("hs", hs);
		
		return "humanManager";
	}
	
	// 직급 검색
	@RequestMapping("searchPosition")
	public String searchPosition (@RequestParam("rcode") String rcode, Model model,
								  @RequestParam("rname") String rname ) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("rcode", rcode);
		hs.put("rname", rname);
		
		ArrayList<Rank> pList = hService.searchPosition(hs);
		model.addAttribute("pList", pList);

		return "positionManager";
	}
	
	// 직급 추가
	@RequestMapping("addPosition")
	public String addPosition(@RequestParam("rcode") String rcode,
							  @RequestParam("rname") String rname ) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("rcode", rcode);
		hs.put("rname", rname);
		
		hService.addPosition(hs);
		
		return "redirect:/Human/positionManager";
	}
	
	// 직급 삭제
	@RequestMapping("deletePosition")
	public String deletePosition(@RequestParam("rcodeChk") String[] rcodeChk) {

		hService.deletePosition(rcodeChk);
		
		return "redirect:/Human/positionManager";
	}
	
	// 직급 목록 선택 시 사원 목록 조회
	@RequestMapping("choiceRcode")
	@ResponseBody
	public ArrayList<Human> choiceRcode(@RequestParam("rcode") String rcode) {
		return hService.choiceRcode(rcode);
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
	
	//사원추가
	@RequestMapping("humanInsert")
	public String humanInsert(@ModelAttribute Human h, @RequestParam("profile_img") MultipartFile imgFile,
							  HttpServletRequest request ) {
		//주소,폰 하나의 문자열로 합침.
		String address = request.getParameter("address1") + request.getParameter("address2");
		String phone = request.getParameter("phone") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		//초기 비밀번호 설정
		String pwd = request.getParameter("add-eno") + request.getParameter("phone3");
		String encPwd = passwordEncoder.encode(pwd);
		//날짜
		String inDate = request.getParameter("add-inDate");
		String birthDay = request.getParameter("add-date");
		//이메일
		String email;
		if(request.getParameter("email3").equals("input-text")) {
			email = request.getParameter("email") + "@" + request.getParameter("email2");
		}else {
			email = request.getParameter("email") + "@" + request.getParameter("email3");
		}
		
		h.setEno(request.getParameter("add-eno"));
		h.setPwd(encPwd);
		h.setName(request.getParameter("add-name"));
		h.setDcode(request.getParameter("add-dept"));
		h.setRcode(request.getParameter("add-rank"));
		h.setGender(request.getParameter("gender"));
		h.setAddress(address);
		h.setEmail(email);
		h.setPhone(phone);
		h.setOriginalFileName(imgFile.getOriginalFilename());
		System.out.println(h);
		if(imgFile != null && !imgFile.isEmpty()) {
			String renameFileName = saveFile(imgFile, request);
			
			if(renameFileName != null) {
				h.setRenameFileName(renameFileName);
			}
		}
		
		
		HashMap<String, Object> hs = new HashMap<>();
		hs.put("h",h);
		hs.put("inDate",inDate);
		hs.put("birthDay",birthDay);
				
		int result = hService.humanInsert(hs);
	
		return "redirect:/Human/humanManager";
	}
	
	//파일 이름 변경
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\Profile-images";
		
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	//사번 중복검사
	@RequestMapping("enoDupChk")
	public void enoDupChk(@RequestParam("eno") String eno, HttpServletResponse response) {
		
		int result = hService.enoDupChk(eno);
		
		boolean chk = result>0 ? true : false;
				
		try {
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//사원추가 부서 리스트
	@RequestMapping("humanAddDeptList")
	@ResponseBody
	public void humanAddDeptList(HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Department> dList = hService.humanAddDeptList();
		
		Gson gson = new GsonBuilder().create();
		try {
			gson.toJson(dList, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	//사원추가 직급 리스트
	@RequestMapping("humanAddRankList")
	@ResponseBody
	public void humanAddRankList(HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Rank> rList = hService.humanAddRankList();
		
		Gson gson = new GsonBuilder().create();
		try {
			gson.toJson(rList, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
