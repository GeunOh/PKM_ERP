package com.my.ERP.Stock.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.ERP.Stock.model.service.StockService;
import com.my.ERP.Stock.model.vo.Product;

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
		System.out.println(plist);
		
		model.addAttribute("plist", plist);
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
	public String supplyManager() {
		
		return "supplyManager";
	}
	
	
	
	/**
	 *  [ ========== 비 품 신 청 현 황 ========== ]
	 */
	@RequestMapping("applicationList")
	public String applicationList() {
		
		return "applicationList";
	}
	
	
	/**
	 *  [ 임 시 거 래 처 ]
	 */
	@RequestMapping("clientManager")
	public String clientManager() {
		
		return "clientManager";
	}
	
}
