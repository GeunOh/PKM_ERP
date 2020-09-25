package com.my.ERP.Stock.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.Stock.model.service.StockService;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.Stock.model.vo.Supply;
import com.my.ERP.common.Pagenation;
import com.my.ERP.common.vo.PageInfo;

@Controller
public class StockController {
	
	@Autowired
	private StockService sService;
	
	/**
	 *  [ ========== 공 통 ========== ]
	 */
	
	
	/**
	 *  [ ========== 제 품 목 록 ========== ]
	 */
	@RequestMapping("productList")
	public String productList(Model model) {
		ArrayList<Product> plist = sService.productList();
		ArrayList<Client> clist = sService.clientList();
		model.addAttribute("plist", plist)
			 .addAttribute("clist", clist);
		return "productList";
	}
	// 제품 정보
	@RequestMapping("showProduct")
	@ResponseBody
	public Product showProduct(@RequestParam("pcode") String pcode) {
		return sService.showProduct(pcode);
	}
	// 제품 삭제
	@RequestMapping("deleteProduct")
	public String deleteProduct(@RequestParam("pcode") String pcode) {
		int result = sService.deleteProduct(pcode);
		return "redirect:/Stock/productList";
	}
	// 제품 추가
	@RequestMapping("addProduct")
	public String addProduct(@RequestParam("pcode") String pcode,
							 @RequestParam("pname") String pname,
							 @RequestParam("cost_price") int cost_price,
							 @RequestParam("selling_price") int selling_price,
							 @RequestParam("p_comment") String p_comment,
							 @RequestParam(value="ccode", required = false) String ccode) {
		Product product = new Product();
		product.setPcode(pcode);
		product.setPname(pname);
		product.setCost_price(cost_price);
		product.setSelling_price(selling_price);
		product.setP_comment(p_comment);
		if(!ccode.equals("")) {
			product.setCcode(ccode);
		}
		
		int result = sService.addProduct(product);
		
		return "redirect:/Stock/productList";
	}
	// 제품 수정
	@RequestMapping("modifyProduct")
	public String modifyProduct(@RequestParam("pcode") String pcode,@RequestParam("beforePcode") String beforePcode,
			 					@RequestParam("pname") String pname,
			 					@RequestParam("cost_price") int cost_price,
			 					@RequestParam("selling_price") int selling_price,
			 					@RequestParam("p_comment") String p_comment,
			 					@RequestParam(value="ccode", required = false) String ccode) {
		// Service에 보낼 객체(해시맵)
		HashMap<String, Object> hs = new HashMap<String, Object>();
		// 수정될 제품 정보
		Product product = new Product();
		product.setPcode(pcode);
		product.setPname(pname);
		product.setCost_price(cost_price);
		product.setSelling_price(selling_price);
		product.setP_comment(p_comment);
		if(!ccode.equals("")) {
			product.setCcode(ccode);
		}
		hs.put("beforePcode", beforePcode);	// 바뀌기전의 pCode
		hs.put("product", product);
		
		int result = sService.modifyProduct(hs);
		
		return "redirect:/Stock/productList";
	}
	// 제품 중복확인
	@RequestMapping("pcodeChk")
	@ResponseBody
	public boolean dcodeChk(@RequestParam("pcode") String pcode) {
		Product product = sService.showProduct(pcode);
		System.out.println(product);
		if(product != null)  {
			return true;	 // 중복(사용불가능)이면 true
		} else{
			return false;   // 사용가능이면 false
		}
	}
	// 거래처 존재확인
	@RequestMapping("ccodeChk")
	@ResponseBody
	public String ccodeChk(@RequestParam("ccode") String ccode) {
		Client client = sService.showClient(ccode);
		System.out.println(client);
		if(client != null)  {
			return "exist";	 // 존재
		} else{
			return "notExist";   // 존재하지 않음
		}
	}
	// 검색창 제품 목록
	@RequestMapping("addProductList")
	@ResponseBody
	public ArrayList<Product> addProductList(){
		return sService.addProductList();
	}
	// 검색창 거래처 목록
	@RequestMapping("addClientList")
	@ResponseBody
	public ArrayList<Client> addClientList(){
		return sService.addClientList();
	}
	// 제품 검색
	@RequestMapping("serachProduct")
	public String serachProduct(@RequestParam("selectClient") String selectClient,
								@RequestParam("selectProduct") String selectProduct, Model model) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("selectClient", selectClient);
		hs.put("selectProduct", selectProduct);
		
		ArrayList<Product> plist = sService.searchProduct(hs);
		ArrayList<Client> clist = sService.clientList();

		model.addAttribute("plist", plist)
			 .addAttribute("clist", clist);
		
		return "productList";
	}
	
	 
	
	
	
	
	/**
	 *  [ ========== 제 품 재 고 관 리 ========== ]
	 */
	@RequestMapping("productManager")
	public String productManager() {
		
		return "productManager";
	}
	
	
	
	/**
	 *  [ ========== 제 품 입 출 고 현 황 ========== ]
	 */
	@RequestMapping("stockInOut")
	public String stockInOut() {
		
		return "stockInOut";
	}
	
	
	
	/**
	 *  [ ========== 비 품 목 록 ========== ]
	 */
	@RequestMapping("supplyList")
	public String supplyList() {
		
		return "supplyList";
	}
	
	
	
	/**
	 *  [ ========== 비 품 재 고 관 리 ========== ]
	 */
	@RequestMapping("supplyManager")
	public String supplyManager(@RequestParam(name="page", required = false) Integer page, Model model) {
		
		int listCount = sService.supplyManagerCount();
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Supply> slist = sService.supplyManager(pi);

		model.addAttribute("slist", slist)
			 .addAttribute("pi", pi);
		
		return "supplyManager";
	}
	
	@RequestMapping("searchSupply")
	public String searchSupply(String scode, String sname, @RequestParam(name="page", required = false) Integer page,
							   @RequestParam(value="price", required = false) String price,
							   @RequestParam(value="price2", required = false) String price2,
							   Model model) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("scode", scode);
		hs.put("sname", sname);
		hs.put("price", price);
		hs.put("price2", price2);
		
		int listCount = sService.searchSupplyCount(hs);
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		PageInfo pi = Pagenation.getPageInfo(currentPage, listCount);
		ArrayList<Supply> slist = sService.searchSupply(hs, pi);
		
		model.addAttribute("hs", hs)
			 .addAttribute("slist", slist)
			 .addAttribute("pi", pi);
		
		return "supplyManager";
	}
	
	/**
	 *  [ ========== 비 품 신 청 현 황 ========== ]
	 */
	@RequestMapping("applicationList")
	public String applicationList() {
		
		return "applicationList";
	}
	
	
	
	
}
