package com.my.ERP.myInfo.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.my.ERP.Human.model.service.HumanService;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.Stock.model.service.StockService;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.Stock.model.vo.Supply;
import com.my.ERP.common.FileDown;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;
import com.my.ERP.myInfo.model.service.MyinfoSerivce;
import com.my.ERP.myInfo.model.vo.Caleander;
import com.my.ERP.myInfo.model.vo.Message;
import com.my.ERP.myInfo.model.vo.Notice;

@Controller
public class MyinfoController {
	
	@Autowired
	private MyinfoSerivce mService;
	
	@Autowired
	private HumanService hService;
	
	@Autowired
	private StockService sService;
	
	@RequestMapping("notice")
	public String NoticeForm(Model model) {
		ArrayList<Notice> nlist = mService.NoticeForm();
		model.addAttribute("nlist", nlist);
		
		return "notice";
	}
	
	@RequestMapping("ImageUploadFile")
	public void ImgUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("resources");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "\\uploadFile" + File.separator; 
	         System.out.println(filePath);
	         
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }

	         String realFileNm = "";
	         
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today + filename.substring(filename.lastIndexOf("."));

	         String rlFileNm = filePath + realFileNm;

	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;

	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }

	         if(is != null) {
	            is.close();
	         }

	         os.flush();
	         os.close();

	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";

	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;; 
	         sFileInfo += "&sFileURL="+ request.getContextPath() + "/resources/uploadFile/" + realFileNm;
	         System.out.println("원본파일명" + sFileInfo);
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	//공지사항 작성
	@RequestMapping("NoticeInsert")
	public String NoticeInsert(@RequestParam("title") String title, @RequestParam("ir1") String text,
			                   HttpSession session, RedirectAttributes ra,
			                   @RequestParam("file") MultipartFile file,
			                   HttpServletRequest request) {
		// 공지사항 테이블 글 작성
		String id = ((Human)session.getAttribute("loginUser")).getEno();
		int result = mService.NoticeInsert(title, text, id);
		// 첨부파일 추가
		
		// 파일이 존재한다면 파일 이름 변경 후 파일 저장
		int fileResult = 0;
		if(file != null && !file.isEmpty()) {
			String renameFileName = saveFile(file, request);
			
			HashMap<String, Object> fileHs = new HashMap<String, Object>();
			fileHs.put("org_file_name", file.getOriginalFilename());
			fileHs.put("stored_file_name", renameFileName);
			fileHs.put("file_size", file.getSize());
			
			fileResult = mService.insertFile(fileHs);
		}
		// 정상적으로 글 작성시
		if(result>0 && fileResult>0)  ra.addFlashAttribute("Imsg", "true");
		else  ra.addFlashAttribute("Imsg", "true"); 
		
		return "redirect:/MyInfo/notice";
	}
	//파일 이름 변경
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// root : /webapp/resources/
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 실제로 저장될 폴더 위치
		String savePath = root + "\\attach-file";
		
		// 지정된 경로로 폴더를 생성
		File folder = new File(savePath);
		
		// 지정된 경로에 폴더가 없다면 폴더 생성
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 현재 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		// 본래 첨부파일 이름
		String originFileName = file.getOriginalFilename();
		// 현재 날짜 + 확장자 (새로운 파일이름)
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "."
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		// 파일을 저장할 위치 및 새로운 파일이름 지정
		String renamePath = folder + "\\" + renameFileName;
		// 파일 이동
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 새로운 파일이름 리턴
		return renameFileName;
	}
	
	//공지사항 수정
	@RequestMapping("NoticeModify")
	public String NoticeModify(@RequestParam("title") String title, @RequestParam("ir2") String text,
							   @RequestParam("no") int no, HttpSession session, RedirectAttributes ra) {
		
		int result = mService.NoticeModify(title, text, no);
		
		if(result>0)  ra.addFlashAttribute("Mmsg", "true");
		else  ra.addFlashAttribute("Mmsg", "true"); 
		
		return "redirect:/MyInfo/notice";
	}
	
	//공지사항 삭제
	@RequestMapping("NoticeDelete")
	public String NoticeDelete(@RequestParam("no") int no, HttpSession session, RedirectAttributes ra) {
		
		int result = mService.NoticeDelete(no);
		
		if(result>0)  ra.addFlashAttribute("Dmsg", "true");
		else  ra.addFlashAttribute("Dmsg", "true"); 
		
		return "redirect:/MyInfo/notice";
	}
	
	//쪽지 사람 검색(글작성)
	@RequestMapping("MsgFindMember")
	public void MsgFindMember(@RequestParam("mem") String mem, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		if(mem.equals("")) {
			System.out.println("빈칸");
			mem = null; 
		}
		
		ArrayList<Human> hList = mService.MsgFindMember(mem);
		
		Gson gson = new GsonBuilder().create();
		try {
			gson.toJson(hList, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지 보내기
	@RequestMapping("MsgSend")
	public void MsgSend(@RequestParam("title") String title, @RequestParam("reciever") String reciever,
			            @RequestParam("content") String content, @RequestParam("writer") String writer, 
			            HttpServletResponse response) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("title", title);
		hs.put("writer", writer);
		hs.put("reciever", reciever);
		hs.put("content", content);
		
		int result = mService.MsgSend(hs);
		
		boolean chk = result>0 ? true : false;	// 부서가 중복되면 true, 아니면 false
		
		try {
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지 수신함 갱신
	@RequestMapping("RecieverMsg")
	public void RecieverMsg(@RequestParam("user") String user, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Message> RmsgList = mService.RecieverMsg(user);

		Gson gson = new GsonBuilder().create();
		try {
			gson.toJson(RmsgList, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지 발신함 갱신
	@RequestMapping("SendMsg")
	public void SendMsg(@RequestParam("user") String user, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Message> SmsgList = mService.SendMsg(user);
		
		Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd'T'HH시 MM분").create();
		try {
			gson.toJson(SmsgList, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지(수신) 상세보기
	@RequestMapping("recieverDetail")
	@ResponseBody
	public Message recieverDetail(@RequestParam("mno") String mno, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		Message recieverDetail = mService.recieverDetail(mno);
		
		return recieverDetail;
	}
	
	//쪽지(수신) 상세보기
	@RequestMapping("sendDetail")
	@ResponseBody
	public Message sendDetail(@RequestParam("mno") String mno, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		Message sendDetail = mService.sendDetail(mno);
		
		return sendDetail;
	}
	
	//쪽지(수신) 안읽은 개수 
	@RequestMapping("NoReadMsg")
	public void NoReadMsg(@RequestParam("user") String user, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		int NoCount = mService.NoReadMsg(user);
		
		try {
			response.getWriter().print(NoCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지(발신) 재전송 
	@RequestMapping("sendResend")
	public void sendResend(@RequestParam("mno") String mno, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		
		Message msg = mService.sendResend(mno);
		
		int result = mService.sendResendMsg(msg);
		
		boolean b = result>0 ? true : false;
		try {
			response.getWriter().print(b);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 첨부파일 다운
	@RequestMapping("fileDown")
	public void fileDown(String bNo, HttpServletResponse response, HttpServletRequest request) throws IOException {
		Notice notice = mService.selectNotice(bNo);
		FileDown.fileDown(notice, response, request);
	}
	
	// 사원검색
	@RequestMapping("searchHuman")
	public String searchHuman(Human human, @RequestParam(value="page", required = false) Integer page,
							  @RequestParam(value="selectVal", required = false) String selectVal,
							  @RequestParam(value="order", required = false) String order,
							  @RequestParam(value="selectDate", required = false) String selectDate,
							  @RequestParam(value="date", required = false) Date date,
							  @RequestParam(value="date2", required = false) Date date2,
							  Model model) {
		System.out.println(human);
		System.out.println(selectVal);
		System.out.println(selectDate);
		
		int currentPage = 1;
		if(page != null) currentPage = page;
		
		SearchOption so = new SearchOption();
		
		if(selectVal != null) {
			if(selectVal.equals("all")) {
				so.setAll("all");
			}else if(selectVal.equals("in")) {
				so.setInUser("in");
			}else if(selectVal.equals("out")){
				so.setOutUser("out");
			}
		}
		if(selectDate != null) {
			if(selectDate.equals("dateAll")) {
				so.setDateAll("dateAll");
			}else if(selectDate.equals("dateSelect")){
				so.setDateSelect("dateSelect");
			}
		}
		
		HashMap<String, Object> hs = new HashMap<>();
		hs.put("so",so);
		hs.put("dept",human.getDcode());
		hs.put("rank",human.getRcode());
		hs.put("email",human.getEmail());
		hs.put("eno",human.getEno());
		hs.put("name",human.getName());
		hs.put("date",date);
		hs.put("date2",date2);
		hs.put("order",order);
		
		System.out.println(hs);
		
		int listCount = hService.SearchHumanListCount(hs);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Human> hList = hService.SearchHumanList(pi, hs);
		System.out.println(hList);
		
		model.addAttribute("pi", pi)
		.addAttribute("hList", hList)
		.addAttribute("selectVal", selectVal)
		.addAttribute("selectDate", selectDate)
		.addAttribute("hs", hs)
		.addAttribute("order", order);
		
		return "searchHuman";
	}
	// 내 근태 정보
	@RequestMapping("workCalendar")
	public String workCalendar() {
		
		return "workCalendar";
	}
	
	// 내 휴가 정보
	@RequestMapping("myVacation")
	public String myVacation(HttpSession session, Model model,
							 @RequestParam(value="page", required = false) Integer page) {
		Human human = (Human)session.getAttribute("loginUser");
		
		String eno = human.getEno();
		
		// 휴가 잔여일수
		HashMap<String, Integer> useDay = mService.vacationUseDays(eno);
		
		int currentPage = 1;
		if(page != null) currentPage = page;
		int listCount = mService.myVacationListCount(eno);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		// 내 휴가신청 내역
		ArrayList<Vacation> vlist = mService.myVacationList(eno, pi);
		
		model.addAttribute("indate", human.getIndate())
		     .addAttribute("useDay", useDay)
		     .addAttribute("vlist", vlist)
		     .addAttribute("pi", pi);
		
		return "myVacation";
	}
	
	// 내 비품 신청 정보
	@RequestMapping("mySupplyRequest")
	public String mySupplyRequest(@RequestParam(value="page", required = false) Integer page
								  ,HttpSession session, Model model) {
		Human human = (Human)session.getAttribute("loginUser");
		String eno = human.getEno();
		
		// 총 신청 수
		HashMap<String, String> hs = mService.totalCount(eno);
		
		// 페이징
		int currentPage = 1;
		if(page!=null) currentPage = page;
		
		int listCount = Integer.parseInt(String.valueOf(hs.get("TOTALCOUNT")));
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		
		List<HashMap<String, String>> slist = mService.supplyRequestList(eno, pi);
		List<Supply> supplyList = mService.supplyList();
		System.out.println(supplyList);
		model.addAttribute("hs", hs)
			 .addAttribute("slist", slist)
			 .addAttribute("pi", pi)
			 .addAttribute("supplyList", supplyList);
		
		return "mySupplyRequest";
	}
	
	// 비품 신청
	@RequestMapping("addSupplyRequest")
	public String addSupplyRequest(String scode, String sname, String count, String comment, String eno) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("eno", eno);
		hs.put("scode", scode);
		hs.put("sname", sname);
		hs.put("count", count);
		hs.put("comment", comment);
		
		int result = mService.addSupplyRequest(hs);
		
		return "redirect:/MyInfo/mySupplyRequest";
	}
	
	@RequestMapping("productWork")
	public String productWork(Model model) {
		ArrayList<Product> plist = sService.productList();
		ArrayList<Client> clist = sService.clientList();
		model.addAttribute("plist", plist)
			 .addAttribute("clist", clist);
		return "productWork";
	}
	@RequestMapping("serachMyProduct")
	public String serachMyProduct(@RequestParam("selectClient") String selectClient,
								  @RequestParam("selectProduct") String selectProduct, Model model) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("selectClient", selectClient);
		hs.put("selectProduct", selectProduct);
		
		ArrayList<Product> plist = sService.searchProduct(hs);
		ArrayList<Client> clist = sService.clientList();

		model.addAttribute("plist", plist)
			 .addAttribute("clist", clist);
		
		return "productWork";
	}
	
	@RequestMapping("addProductInOut")
	public String addProductInOut(String status, String ccode, String pcode, String count, String comment) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("status", status);
		hs.put("ccode", ccode);
		hs.put("pcode", pcode);
		hs.put("count", count);
		hs.put("comment", comment);
		System.out.println(hs);
		
		int result = mService.addProductInOut(hs);
		
		return "redirect:/MyInfo/productWork";
	}
	
	@RequestMapping("workData")
	public void workData(@RequestParam("eno") String eno, HttpServletResponse response)  {
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<Caleander> list = mService.workData(eno);
		System.out.println(list);
		Gson gson = new GsonBuilder().create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
