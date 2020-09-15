package com.my.ERP.Stock.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Stock.model.dao.StockDAO;
import com.my.ERP.Stock.model.vo.Product;

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
	
}
