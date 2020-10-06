package com.my.ERP.Stock.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.Stock.model.vo.Supply;
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
	// 거래처 목록
	public ArrayList<Client> clientList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("stockMapper.clientList");
	}
	// 비품 재고 관리
	public ArrayList<Supply> supplyManager(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("stockMapper.supplyManager", null, rowbounds);
	}
	// 비품 재고관리 전체 행 수
	public int supplyManagerCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("stockMapper.supplyManagerCount");
	}
	// 비품 검색 행 개수
	public int searchSupplyCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.selectOne("stockMapper.searchSupplyCount", hs);
	}
	// 비품 검색
	public ArrayList<Supply> searchSupply(SqlSessionTemplate sqlSession, HashMap<String, Object> hs, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("stockMapper.searchSupply", hs, rowbounds);
	}
	// 제품 목록 수
	public int productListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("stockMapper.productListCount");
	}
	// 제묵 목록(오버로딩)
	public ArrayList<Product> productList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("stockMapper.productManagerList", null, rowBounds);
	}
	// 비품코드 중복체크
	public Supply showSupply(SqlSessionTemplate sqlSession, String scode) {
		return sqlSession.selectOne("stockMapper.showSupply", scode);
	}
	public int addSupply(SqlSessionTemplate sqlSession, Supply supply) {
		return sqlSession.insert("stockMapper.addSupply", supply);
	}
	public int modifySupply(SqlSessionTemplate sqlSession, Supply supply) {
		return sqlSession.update("stockMapper.modifySupply", supply);
	}
	public int deleteSupply(SqlSessionTemplate sqlSession, String del_scode) {
		return sqlSession.delete("stockMapper.deleteSupply", del_scode);
	}
	
	
	
}
