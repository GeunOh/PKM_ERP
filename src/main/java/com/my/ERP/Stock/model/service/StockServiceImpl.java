package com.my.ERP.Stock.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Stock.model.dao.StockDAO;
import com.my.ERP.Stock.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;
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
	// 거래처 목록
	@Override
	public ArrayList<Client> clientList(PageInfo pi) {
		return sDAO.clientList(sqlSession, pi);
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
	// 거래처 검색
	@Override
	public ArrayList<Client> searchClient(HashMap<String, String> hs, PageInfo pi) {
		return sDAO.searchClient(sqlSession, hs, pi);
	}
	// 거래처 페이징을 위한 행 개수
	@Override
	public int clientListCount() {
		return sDAO.clientListCount(sqlSession);
	}
	// 거래처 목록
	@Override
	public ArrayList<Client> clientList() {
		return sDAO.clientList(sqlSession);
	}
	// 거래처 검색 시 페이징을 위한 행 개수
	@Override
	public int searchClientListCount(HashMap<String, String> hs) {
		return sDAO.searchClientListCount(sqlSession, hs);
	}
	// 거래처 추가
	@Override
	public int addClient(Client client) {
		return sDAO.addClient(sqlSession, client);
	}
	// 거래처 삭제
	@Override
	public int deleteClient(String ccode) {
		return sDAO.deleteClient(sqlSession, ccode);
	}
	// 거래처 수정
	@Override
	public int modifyClient(HashMap<String, String> hs) {
		return sDAO.modifyClient(sqlSession, hs);
	}
	
}
