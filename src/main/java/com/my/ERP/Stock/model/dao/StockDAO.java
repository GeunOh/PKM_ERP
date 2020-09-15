package com.my.ERP.Stock.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Stock.model.vo.Product;

@Repository("sDAO")
public class StockDAO {
	
	// 제품 목록
	public ArrayList<Product> productList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("stockMapper.productList");
	}
	// 단일 제품 정보
	public Product showProduct(SqlSessionTemplate sqlSession, String pcode) {
		return sqlSession.selectOne("stockMapper.showProduct",pcode);
	}
	// 제품 삭제
	public int deleteProduct(SqlSessionTemplate sqlSession, String pcode) {
		return sqlSession.delete("stockMapper.deleteProduct", pcode);
	}
	// 제품 등록
	public int addProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.delete("stockMapper.addProduct", product);
	}
	
	
	
}
