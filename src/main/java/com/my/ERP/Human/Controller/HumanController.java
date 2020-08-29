package com.my.ERP.Human.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

@Controller
public class HumanController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private HumanService hService;
	
	/**
	 * 	[ ========== 인 사 관 리 ========== ]
	 */	
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
		if(request.getParameter("add-email3").equals("input-text")) {
			email = request.getParameter("add-email") + "@" + request.getParameter("add-email2");
		}else {
			email = request.getParameter("add-email") + "@" + request.getParameter("add-email3");
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
				
		hService.humanInsert(hs);
	
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
	
	/**
	 * 	[ ========== 직 급 관 리 ========== ]
	 */	
	// 직급관리
	@RequestMapping("positionManager")
	public String positionMain(Model model) {
		
		ArrayList<Rank> pList = hService.positionList();
		model.addAttribute("pList",pList);
		return "positionManager";
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
	
	/**
	 * 	[ ========== 부 서 관 리 ========== ]
	 */	
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
	
	// 부서코드 중복 체크
	@RequestMapping("dcodeDupChk")
	public void dcodeDupChk(@RequestParam("dcode") String dcode, HttpServletResponse response) {
		
		int result = hService.dcodeDupChk(dcode);
		boolean chk = result>0 ? true : false;	// 부서가 중복되면 true, 아니면 false
	
		try {
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 	[ ========== 급 여 관 리 ========== ]
	 */	
	// 급여관리
	@RequestMapping("salaryManager")
	public String salaryMain() {
		return "salaryManager";
	}
	
	/**
	 * 	[ ========== 근 태 관 리 ========== ]
	 */	
	// 근태관리
	@RequestMapping("workInOutManager")
	public String workInOut() {
		return "workInOutManager";
	}
	
	/**
	 * 	[ ========== 휴 가 관 리 ========== ]
	 */	
	// 휴가관리
	@RequestMapping("vacationManager")
	public String vacationMain(@RequestParam(value="page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page!=null) currentPage = page;
		
		int vListCount = hService.vacationListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, vListCount);
		
		ArrayList<Vacation> vList = hService.vacationList(pi);
		model.addAttribute("vList", vList)
			 .addAttribute("pi", pi);
		
		return "vacationManager";
	}
	
	// 휴가 승인
	@RequestMapping("approvalVacation")
	public String approvalVacation(@RequestParam("vno") String[] vnoList, RedirectAttributes ra) {
		
		int result = hService.approvalVacation(vnoList);
		
		String success = "승인되었습니다.";
		ra.addFlashAttribute("success", success);
		
		return "redirect:/Human/vacationManager";
	}
	
	// 휴가 검색
	@RequestMapping("searchVacation")
	public String searchVacation(@RequestParam(value="page", required = false) Integer page,
								 @RequestParam("selectDept") String selectDept,
								 @RequestParam("selectRank") String selectRank,
								 @RequestParam("eno") String eno, @RequestParam("name") String name,
								 @RequestParam("selectDate") String selectDate,
								 @RequestParam(value="date", required = false) Date date,
								 @RequestParam(value="date2", required = false) Date date2,
								 Model model) {
		
		SearchOption so = new SearchOption();
		
		System.out.println(selectDate);
		if(selectDate.equals("dateAll")) {
			so.setDateAll(selectDate);
		} else if (selectDate.equals("dateSelect")) {
			so.setDateSelect(selectDate);
		} else {
			System.out.println("===============selectDate ERROR===============");
		}
		
		// 검색 조건들 hashMap에 저장
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so",so);
		hs.put("selectDept",selectDept);
		hs.put("selectRank",selectRank);
		hs.put("eno",eno);
		hs.put("name",name);
		hs.put("date",date);
		hs.put("date2",date2);
		
		// 페이징
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		int listCount = hService.searchVacationListCount(hs);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		ArrayList<Vacation> vList = hService.searchVacationList(hs, pi);
		model.addAttribute("vList", vList)
			 .addAttribute("pi", pi)
			 .addAttribute("hs", hs)
			 .addAttribute("selectDate", selectDate);
		return "vacationManager";
	}
	
	// 휴가 거절
	@RequestMapping("refuseVacation")
	public String refuseVacation(@RequestParam("vno") String[] vnoList, RedirectAttributes ra) {
		
		int result = hService.refuseVacation(vnoList);
		
		String fail = "거절되었습니다.";
		ra.addFlashAttribute("fail", fail);
		
		return "redirect:/Human/vacationManager";
	}
	
	
	/**
	 * 	[ ========== 마 이 페 이 지  ========== ]
	 */	
	// 마이페이지
	@RequestMapping("myInfo")
	public String myinfoMain(HttpSession session, Model model) {
		
		Human loginHuman = (Human)session.getAttribute("loginUser");
		
		String eno = loginHuman.getEno();
		// 잔여 연차 개수 가져오기.
		int result = hService.showVacationDays(eno);
		model.addAttribute("vacationDay", result);
		
		return "myInfo";
	}
	
	// 휴가 신청 하기
	@RequestMapping("addVacation")
	public String addVacation(@ModelAttribute("vacation") Vacation vacation,
							  @RequestParam("eno") String eno,
							  @RequestParam("vType") String vType,
							  @RequestParam("startDate") Date startDate,
							  @RequestParam("endDate") Date endDate,
							  @RequestParam("useDay") int useDay,
							  @RequestParam(value="reason", required=false) String reason) {
		
		int result = hService.addVacation(vacation);
		
		return "redirect:/Human/myInfo";
	}
	
	
	
	
	
	
}
