package com.my.ERP.Stock.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.Stock.model.dao.StockDAO;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.Stock.model.vo.Supply;
import com.my.ERP.common.vo.PageInfo;

@Service("sService")
public class StockServiceImpl implements StockService {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	StockDAO sDAO;
	
	// 제품 목록
	@Override
	public ArrayList<Product> productList() {
		return sDAO.productList(sqlSession);
	}
	// 단일 제품 정보
	@Override
	public Product showProduct(String pcode) {
		return sDAO.showProduct(sqlSession, pcode);
	}
	// 제품 삭제
	@Override
	public int deleteProduct(String pcode) {
		return sDAO.deleteProduct(sqlSession, pcode);
	}
	// 제품 등록
	@Override
	public int addProduct(Product product) {
		return sDAO.addProduct(sqlSession, product);
	}
	// 검색창 제품 목록
	@Override
	public ArrayList<Product> addProductList() {
		return sDAO.addProductList(sqlSession);
	}
	// 제품 수정
	@Override
	public int modifyProduct(HashMap<String, Object> hs) {
		return sDAO.modifyProduct(sqlSession, hs);
	}
	// 거래처 존재 확인
	@Override
	public Client showClient(String ccode) {
		return sDAO.showClient(sqlSession, ccode);
	}
	// 검색창 거래처 목록
	@Override
	public ArrayList<Client> addClientList() {
		return sDAO.addClientList(sqlSession);
	}
	// 제품 검색
	@Override
	public ArrayList<Product> searchProduct(HashMap<String, String> hs) {
		return sDAO.searchProduct(sqlSession, hs);
	}
	// 거래처 목록
	@Override
	public ArrayList<Client> clientList() {
		return sDAO.clientList(sqlSession);
	}
	// 비품 재고 관리
	@Override
	public ArrayList<Supply> supplyManager(PageInfo pi) {
		return sDAO.supplyManager(sqlSession, pi);
	}
	// 비품 재고 관리 전체 행 개수
	@Override
	public int supplyManagerCount() {
		return sDAO.supplyManagerCount(sqlSession);
	}
	
}
