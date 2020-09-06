package com.my.ERP.Human.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.PeopleCount;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.Human.model.vo.Salary;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.Human.model.vo.WorkInOut;
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
	public String humanMain(@RequestParam(value="page", required = false) Integer page, Model model,
			                @RequestParam(value="order", required = false) String order) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = hService.HumanListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Human> hList = hService.HumanList(pi,order);
		
		model.addAttribute("pi", pi)
		     .addAttribute("hList", hList)
		     .addAttribute("order", order);
		
		return "humanManager";
	}
	
	// 사원관리 검색
	@RequestMapping("SearchHuman")
	public String SearchHuman(@RequestParam(value="page", required = false) Integer page, Model model,
							  @RequestParam("selectVal") String selectVal, @RequestParam("selectDept") String selectDept,
							  @RequestParam("selectRank") String selectRank, @RequestParam("email") String email,
							  @RequestParam("eno") String eno, @RequestParam("name") String name,
							  @RequestParam("selectDate") String selectDate, @RequestParam(value="order", required = false) String order,
							  @RequestParam(value="date", required = false) Date date,
							  @RequestParam(value="date2", required = false) Date date2
			) {
		System.out.println(order);
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
		String address = request.getParameter("address1") +"/"+ request.getParameter("address2");
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
							  @RequestParam("rname") String rname,
							  RedirectAttributes ra) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("rcode", rcode);
		hs.put("rname", rname);
		
		hService.addPosition(hs);
		
		String addMsg = "추가되었습니다.";
		ra.addFlashAttribute("addMsg", addMsg);
		
		return "redirect:/Human/positionManager";
	}
	
	// 직급 삭제
	@RequestMapping("deletePosition")
	public String deletePosition(@RequestParam("rcodeChk") String[] rcodeChk,
								 RedirectAttributes ra) {

		hService.deletePosition(rcodeChk);
		
		String deleteMsg = "삭제되었습니다.";
		ra.addFlashAttribute("deleteMsg", deleteMsg);
		
		return "redirect:/Human/positionManager";
	}
	
	// 직급 목록 선택 시 사원 목록 조회
	@RequestMapping("choiceRcode")
	@ResponseBody
	public ArrayList<Human> choiceRcode(@RequestParam("rcode") String rcode) {
		return hService.choiceRcode(rcode);
	}
	
	// 직급 추가 시 직급코드 중복확인
	@RequestMapping("rcodeDupChk")
	@ResponseBody
	public boolean rcodeDupChk(@RequestParam("rcode") String rcode) {
		
		// 중복이면 true 
		int result = hService.rcodeDupChk(rcode);
		return result>0 ? true : false;
	}
	
	// 직급 수정시 해당 부서 정보 가져오기
	@RequestMapping("positonModifyInfo")
	@ResponseBody
	public Rank positonModifyInfo(@RequestParam("rcode") String rcode) {
		return hService.positonModifyInfo(rcode);
	}
	
	// 직급 수정하기
	@RequestMapping("modifyPositon")
	public String modifyPositon(@RequestParam("before-rcode") String beforeRcode,
								@RequestParam("modify-rcode") String rcode,
								@RequestParam("modify-rname") String rname,
								RedirectAttributes ra) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("beforeRcode", beforeRcode);
		hs.put("rcode", rcode);
		hs.put("rname", rname);
		
		int result = hService.modifyPositon(hs);
		String modifyMsg = "수정되었습니다.";
		ra.addFlashAttribute("modifyMsg", modifyMsg);
		
		return "redirect:/Human/positionManager";
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
	public Department departmentShow(@RequestParam("deptName") String deptName) {
		// 해당 부서 조회
		Department dept = hService.departmentShow(deptName);
		return dept;
	}
	
	// 부서관리페이지 - 각 부서 선택시 사원 조회
	@RequestMapping("departHumanShow")
	@ResponseBody
	public ArrayList<Human> departHumanShow(@RequestParam("deptName") String deptName){
		ArrayList<Human> hList = hService.departHumanShow(deptName);
		return hList;
	}
	// 부서 등록 기능
	@RequestMapping("addDept")
	public String addDept(HttpServletRequest request, RedirectAttributes ra) {
		
		Department dept = new Department();
		dept.setDcode(request.getParameter("dcode"));
		dept.setDname(request.getParameter("dname"));
		dept.setDcomment(request.getParameter("dcomment"));
		dept.setEno(request.getParameter("ename")); // eno 이지만 직원의 이름을 가지고있음
		
		hService.addDept(dept);
		
		String insert = "등록되었습니다.";
		ra.addFlashAttribute("insert", insert);
		
		return "redirect:/Human/departmentManager";
	}
	
	// 부서 삭제 기능
	@RequestMapping("delDept")
	public String delDept(@RequestParam("dname") String[] dnames, RedirectAttributes ra) {
		
		hService.delDept(dnames);
		
		String deleteDept = "삭제되었습니다.";
		ra.addFlashAttribute("deleteDept", deleteDept);
		
		return "redirect:/Human/departmentManager";
	}
	
	// 부서 정보 수정 기능
	@RequestMapping("modifyDept")
	public String modifyDept(HttpServletRequest request, RedirectAttributes ra) {
		
		String beforeDeptName = request.getParameter("beforeDept");
		
		Department dept = new Department();
		dept.setDcode(request.getParameter("dcode"));
		dept.setDname(request.getParameter("dname"));
		dept.setDcomment(request.getParameter("dcomment"));
		dept.setEno(request.getParameter("ename")); // eno 이지만 직원의 이름을 가지고있음
		dept.setStartDate(request.getParameter("startDate"));
		
		hService.modifyDept(dept, beforeDeptName);
		
		String modify = "수정되었습니다.";
		ra.addFlashAttribute("modify", modify);
		
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
	public String salaryMain(@RequestParam(value="page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int sListCount = hService.salaryListCount();
		PageInfo pi = Pagenation.getPageInfo(currentPage, sListCount);
		
		ArrayList<Salary> sList = hService.salaryList(pi);
		model.addAttribute("sList", sList)
			 .addAttribute("pi", pi);
		
		return "salaryManager";
	}
	
	// 급여관리 검색
	@RequestMapping("searchSalary")
	public String searchSalary(@RequestParam(value="page", required = false) Integer page,
							   @RequestParam("selectDept") String selectDept,
							   @RequestParam("eno") String eno,
							   @RequestParam("name") String name,
							   @RequestParam("selectDate") String selectDate,
							   @RequestParam(value = "date", required = false) Date date,
							   @RequestParam(value = "date2", required = false) Date date2, Model model){
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		SearchOption so = new SearchOption();
		if(selectDate.equals("dateAll")) {
			so.setDateAll(selectDate);
		} else if(selectDate.equals("dateSelect")) {
			so.setDateSelect(selectDate);
		}
		
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so", so);
		hs.put("selectDept", selectDept);
		hs.put("eno", eno);
		hs.put("name", name);
		hs.put("date", date);
		hs.put("date2", date2);
		
		int sListCount = hService.searchSalaryListCount(hs);
		PageInfo pi = Pagenation.getPageInfo(currentPage, sListCount);
		ArrayList<Salary> sList = hService.searchSalaryList(hs,pi);
		
		model.addAttribute("sList", sList)
			 .addAttribute("pi", pi)
			 .addAttribute("hs", hs)
			 .addAttribute("selectDate", selectDate);
		
		return "salaryManager";
	}
	
	// 수정할 급여 정보
	@RequestMapping("salaryModifyInfo")
	@ResponseBody
	public Salary salaryModifyInfo(@RequestParam("eno") String eno) {
		return hService.salaryModifyInfo(eno);
	}
	
	// 수정하기
	@RequestMapping("modifySalary")
	public String modifySalary(@RequestParam("modify-salary") String salary,
							   @RequestParam("modify-eno") String eno, RedirectAttributes ra) {
		
		int result = hService.modifySalary(salary, eno);
		String success = "수정되었습니다.";
		ra.addFlashAttribute("success", success);
		
		return "redirect:/Human/salaryManager";
	}
	
	/**
	 * 	[ ========== 근 태 관 리 ========== ]
	 */	
	// 근태관리
	@RequestMapping("workInOutManager")
	public String workInOut(@RequestParam(value="page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) currentPage = page;
		
		int listCount = hService.workListCount();
		PageInfo pi = Pagenation.getWorkPageInfo(currentPage, listCount);
		ArrayList<WorkInOut>wlist = hService.workList(pi);    //회원 출근기록     
		ArrayList<WorkInOut>mlist = hService.enoWorkList(pi); //회원 이름  
		PeopleCount mCount = hService.WorkPeopleCount();
		System.out.println(mCount);
		System.out.println(wlist);
		model.addAttribute("wlist", wlist)
			 .addAttribute("mlist", mlist)
			 .addAttribute("mCount", mCount)
			 .addAttribute("pi", pi);
		
		return "workInOutManager";
	}
	
	@RequestMapping("SearchWork")
	public String SearchWork(@RequestParam(value="page", required = false) Integer page, Model model,
							 @RequestParam("selectVal") String selectVal, @RequestParam("selectDept") String selectDept,
							 @RequestParam("selectRank") String selectRank, @RequestParam("eno") String eno, 
							 @RequestParam("name") String name, @RequestParam("selectDate") String selectDate,
							 @RequestParam(value="date", required = false) String date) {
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
		
		HashMap<String, Object> hs = new HashMap<>();
		hs.put("so",so);
		hs.put("dept",selectDept);
		hs.put("rank",selectRank);
		hs.put("eno",eno);
		hs.put("name",name);
		hs.put("date",date);
		int month = Integer.parseInt(date.substring(5));
		int listCount = hService.SearchWorkCount(hs);
		PageInfo pi = Pagenation.getWorkPageInfo(currentPage, listCount);
		ArrayList<WorkInOut> wlist = hService.SearchWorkList(pi, hs);    //회원 출근기록
		ArrayList<WorkInOut> mlist = hService.SearchWorkEnoList(pi, hs); //회원 이름
		
		model.addAttribute("pi", pi)
	         .addAttribute("wlist", wlist)
	         .addAttribute("mlist", mlist)
	         .addAttribute("month", month)
	         .addAttribute("selectVal", selectVal)
	         .addAttribute("selectDate", selectDate)
	         .addAttribute("hs", hs);
		
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
								 @RequestParam("name") String name,
								 @RequestParam("selectDate") String selectDate,
								 @RequestParam(value="date", required = false) Date date,
								 @RequestParam(value="date2", required = false) Date date2,
								 @RequestParam("selectVal") String selectVal,
								 Model model) {
		
		SearchOption so = new SearchOption();
		// 구분
		if(selectVal.equals("all")) {
			so.setAll(selectVal);
		} else if(selectVal.equals("wait")) {
			so.setWait(selectVal);
		} else if(selectVal.equals("ok")) {
			so.setOk(selectVal);
		} else if(selectVal.equals("no")) {
			so.setNo(selectVal);
		}
		
		// 날짜
		if (selectDate.equals("dateAll")) {
			so.setDateAll(selectDate);
		} else if(selectDate.equals("dateRequest")) {
			so.setDateRequest(selectDate);
		} else if (selectDate.equals("dateStart")) {
			so.setDateStart(selectDate);
		} else if (selectDate.equals("dateEnd")) {
			so.setDateEnd(selectDate);
		}
		
		// 검색 조건들 hashMap에 저장
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("so",so);
		hs.put("selectDept",selectDept);
		hs.put("selectRank",selectRank);
		hs.put("name",name);
		hs.put("date",date);
		hs.put("date2",date2);
		
		System.out.println(hs);
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
		// 출,퇴근 체크
		WorkInOut work = hService.WorkSysdate(eno);
		model.addAttribute("vacationDay", result)
		     .addAttribute("work", work);
		
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
		
		System.out.println(vacation);
		int result = hService.addVacation(vacation);
		
		return "redirect:/Human/myInfo";
	}
	
	@RequestMapping("humanModifyInfo")
	public void humanModifyInfo(HttpServletResponse res, @RequestParam("eno") String eno) {
		
		res.setContentType("application/json; charset=UTF-8");
		
		Human h = hService.humanModifyInfo(eno);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(h, res.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("WorkTimeInOutAdd")
	public String WorkTimeIn(HttpSession session, @RequestParam("num") int num) throws ParseException {
		
	    Human h = (Human)session.getAttribute("loginUser");
		String eno = h.getEno();
		String type = null;
		
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
		String date = sf.format(new java.util.Date());
		java.util.Date t1 = sf.parse(date);
		java.util.Date t2 = sf.parse("09:00:00");
		
		if(t1.getTime()-t2.getTime()>0) type = "지각"; 
		else type = "정상 출근"; 
		
		if(num == 1) hService.WorkTimeIn(eno, type);
		else hService.WorkTimeOut(eno);
		
		
		return "redirect:/Human/myInfo";
	}
	
	@RequestMapping("HumanManagerModify")
	public String HumanManagerModify(@RequestParam("modify-eno") String eno, @RequestParam("modify-dept") String dept,
									 @RequestParam("modify-rank") String rank, @RequestParam("type") int type) {
		System.out.println(type);
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("eno", eno);
		hs.put("dept", dept);
		hs.put("rank", rank);
		
		if(type == 1) hService.HumanManagerModify(hs);
		else hService.HumanManagerDelete(hs);
		
		
		return "redirect:/Human/humanManager";
	}
}
