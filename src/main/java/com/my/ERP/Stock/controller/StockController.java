package com.my.ERP.Stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StockController {
	
	/**
	 *  [ ========== 공 통 ========== ]
	 */
	
	
	
	
	/**
	 *  [ ========== 제 품 목 록 ========== ]
	 */
	@RequestMapping("productList")
	public String productList() {
		
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
