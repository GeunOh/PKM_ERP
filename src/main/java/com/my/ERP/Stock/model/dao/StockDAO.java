package com.my.ERP.Stock.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Stock.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.common.vo.PageInfo;

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
	// 검색창 제품 목록
	public ArrayList<Product> addProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("stockMapper.addProductList");
	}
	// 제품 수정
	public int modifyProduct(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.update("stockMapper.modifyProduct", hs);
	}
	// 거래처 목록
	public ArrayList<Client> clientList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("stockMapper.clientList", null, rowbounds);
	}
	// 거래처 존재 확인
	public Client showClient(SqlSessionTemplate sqlSession, String ccode) {
		return sqlSession.selectOne("stockMapper.showClient", ccode);
	}
	// 검색창 거래처 목록
	public ArrayList<Client> addClientList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("stockMapper.addClientList");
	}
	// 제품 검색
	public ArrayList<Product> searchProduct(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return (ArrayList)sqlSession.selectList("stockMapper.searchProduct", hs);
	}
	// 거래처 검색
	public ArrayList<Client> searchClient(SqlSessionTemplate sqlSession, HashMap<String, String> hs, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("stockMapper.searchClient", hs, rowbounds);
	}
	// 거래처 페이징을 위한 행 개수
	public int clientListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("stockMapper.clientListCount");
	}
	// 거래처 목록(페이징)
	public ArrayList<Client> clientList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("stockMapper.clientList");
	}
	// 검색 시 페이징처리를 위한 카운트
	public int searchClientListCount(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.selectOne("stockMapper.searchClientListCount", hs);
	}
	// 거래처 추가
	public int addClient(SqlSessionTemplate sqlSession, Client client) {
		return sqlSession.insert("stockMapper.addClient", client);
	}
	// 거래처 삭제
	public int deleteClient(SqlSessionTemplate sqlSession, String ccode) {
		return sqlSession.delete("stockMapper.deleteClient", ccode);
	}
	
	
	
}
