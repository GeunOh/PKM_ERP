package com.my.ERP.myInfo.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.myInfo.model.service.MyinfoSerivce;
import com.my.ERP.myInfo.model.vo.Notice;

@Controller
public class MyinfoController {
	
	@Autowired
	private MyinfoSerivce mService;
	
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
			                   HttpSession session, RedirectAttributes ra) {
		
		String id = ((Human)session.getAttribute("loginUser")).getEno();
		int result = mService.NoticeInsert(title, text, id);
		
		if(result>0)  ra.addFlashAttribute("Imsg", "true");
		else  ra.addFlashAttribute("Imsg", "true"); 
		
		return "redirect:/MyInfo/notice";
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
}
