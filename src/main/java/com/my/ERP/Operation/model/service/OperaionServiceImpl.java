package com.my.ERP.Operation.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Operation.model.dao.OperationDAO;
import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.common.vo.PageInfo;

@Service("oService")
public class OperaionServiceImpl implements OperationService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OperationDAO oDAO;
	
	// 거래처 페이징을 위한 행 개수
	@Override
	public int clientListCount() {
		return oDAO.clientListCount(sqlSession);
	}
	// 거래처 목록
	@Override
	public ArrayList<Client> clientList(PageInfo pi) {
		return oDAO.clientList(sqlSession, pi);
	}
	// 거래처 검색 시 페이징을 위한 행 개수
	@Override
	public int searchClientListCount(HashMap<String, String> hs) {
		return oDAO.searchClientListCount(sqlSession, hs);
	}
	// 거래처 추가
	@Override
	public int addClient(Client client) {
		return oDAO.addClient(sqlSession, client);
	}
	// 거래처 삭제
	@Override
	public int deleteClient(String ccode) {
		return oDAO.deleteClient(sqlSession, ccode);
	}
	// 거래처 수정
	@Override
	public int modifyClient(HashMap<String, String> hs) {
		return oDAO.modifyClient(sqlSession, hs);
	}
	
	// 거래처 존재 확인
	@Override
	public Client showClient(String ccode) {
		return oDAO.showClient(sqlSession, ccode);
	}
	// 거래처 검색
	@Override
	public ArrayList<Client> searchClient(HashMap<String, String> hs, PageInfo pi) {
		return oDAO.searchClient(sqlSession, hs, pi);
	}
	@Override
	public Object clientsList() {
		return oDAO.clientsList(sqlSession);
	}
	@Override
	public List<HashMap<String, String>> salesList(String year) {
		return oDAO.salesList(sqlSession, year);
	}
	@Override
	public Object getInOutCount(String year) {
		return oDAO.getInOutCount(sqlSession, year);
	}	
}
