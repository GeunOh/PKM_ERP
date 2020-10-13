package com.my.ERP.Operation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.ERP.Operation.model.service.OperationService;
import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;

@Controller
public class OperationController {
	
	@Autowired
	private OperationService oService;
	
	/**
	 *  [ ========== 거 래 처 관 리 ========== ]
	 */
	@RequestMapping("clientManager")
	public String clientManager(Model model, @RequestParam(value="page", required = false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = oService.clientListCount();
		
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Client> clist = oService.clientList(pi);
		
		model.addAttribute("clist", clist)
		     .addAttribute("pi", pi);
		
		return "clientManager";
	}
	// 거래처 검색
	@RequestMapping("searchClient")
	public String searchClient(@RequestParam("cname") String cname,
							   @RequestParam("ccode") String ccode,
							   @RequestParam("cmanager") String cmanager,
							   @RequestParam("cphone") String cphone,
							   @RequestParam(value="c_comment", required = false ) String c_comment,
							   Model model, @RequestParam(value="page", required = false) Integer page) {
		// 검색 조건 저장
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cname", cname);
		hs.put("ccode", ccode);
		hs.put("cmanager", cmanager);
		hs.put("cphone", cphone);
		hs.put("c_comment", c_comment);
		// 페이징
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		// 검색 후 행 개수 
		int listCount = oService.searchClientListCount(hs);
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);	// 페이징
		// 검색 내용
		ArrayList<Client> clist = oService.searchClient(hs, pi);
		model.addAttribute("clist", clist)
			 .addAttribute("pi", pi)
			 .addAttribute("hs", hs);
		return "clientManager";
	}
	// 거래처 추가
	@RequestMapping("addClient")
	public String addClient(@RequestParam("add_ccode") String ccode,
							@RequestParam("add_cname") String cname,
							@RequestParam("add_cmanager") String cmanager,
							@RequestParam("add_cphone") String cphone,
							@RequestParam("add_c_comment") String c_comment) {
		
		Client client = new Client();
		client.setCcode(ccode);
		client.setCname(cname);
		client.setCmanager(cmanager);
		client.setCphone(cphone);
		client.setC_comment(c_comment);
		
		int result = oService.addClient(client);
		
		return "redirect:/Operation/clientManager";
	}
	// 거래처 삭제
	@RequestMapping("deleteClient")
	public String deleteClient(@RequestParam("del_ccode") String ccode) {
		
		int result = oService.deleteClient(ccode);
		
		return "redirect:/Operation/clientManager";
	}
	// 거래처 수정 내용
	@RequestMapping("showClient")
	@ResponseBody
	public Client showClient(@RequestParam("ccode") String ccode) {
		return oService.showClient(ccode);
	}
	// 거래처 수정
	@RequestMapping("modifyClient")
	public String modifyClient(@RequestParam("modify_ccode") String ccode,
							   @RequestParam("modify_cname") String cname,
							   @RequestParam("modify_cmanager") String cmanager,
							   @RequestParam("modify_cphone") String cphone,
							   @RequestParam("modify_c_comment") String c_comment,
							   @RequestParam("beforeCcode") String beforeCcode) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("ccode", ccode);
		hs.put("cname", cname);
		hs.put("cmanager", cmanager);
		hs.put("cphone", cphone);
		hs.put("c_comment", c_comment);
		hs.put("beforeCcode", beforeCcode);
		
		int result = oService.modifyClient(hs);
		return "redirect:/Operation/clientManager";
	}
	@RequestMapping("clientsList")
	@ResponseBody
	public Object clientsList() {
		return oService.clientsList();
	}
	
	@RequestMapping("salesManager")
	public String salesManager(Model model, String year) {
		List<HashMap<String, String>> slist = oService.salesList(year);
		model.addAttribute("slist", slist);
		
		return "salesManager";
	}
	@RequestMapping("getInOutCount")
	@ResponseBody
	public Object getInOutCount(String year) {
		System.out.println(year);
		return oService.getInOutCount(year);
	}
	
}
