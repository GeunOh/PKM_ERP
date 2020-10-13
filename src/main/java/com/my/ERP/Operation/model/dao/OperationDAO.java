package com.my.ERP.Operation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.common.vo.PageInfo;

@Repository("oDAO")
public class OperationDAO {
	
	// 거래처 페이징을 위한 행 개수
	public int clientListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("operationMapper.clientListCount");
	}
	// 거래처 목록
	public ArrayList<Client> clientList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("operationMapper.clientList", null, rowbounds);
	}
	// 검색 시 페이징처리를 위한 카운트
	public int searchClientListCount(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.selectOne("operationMapper.searchClientListCount", hs);
	}
	// 거래처 추가
	public int addClient(SqlSessionTemplate sqlSession, Client client) {
		return sqlSession.insert("operationMapper.addClient", client);
	}
	// 거래처  삭제
	public int deleteClient(SqlSessionTemplate sqlSession, String ccode) {
		return sqlSession.delete("operationMapper.deleteClient", ccode);
	}
	// 거래처 수정
	public int modifyClient(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.update("operationMapper.modifyClient", hs);
	}
	// 거래처 존재 확인
	public Client showClient(SqlSessionTemplate sqlSession, String ccode) {
		return sqlSession.selectOne("operationMapper.showClient", ccode);
	}
	// 거래처 검색
	public ArrayList<Client> searchClient(SqlSessionTemplate sqlSession, HashMap<String, String> hs, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("operationMapper.searchClient", hs, rowbounds);
	}
	public Object clientsList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("operationMapper.clientsList");
	}
	public List<HashMap<String, String>> salesList(SqlSessionTemplate sqlSession, String year) {
		return sqlSession.selectList("operationMapper.salesList", year);
	}
	public Object getInOutCount(SqlSessionTemplate sqlSession, String year) {
		return sqlSession.selectList("operationMapper.getInOutCount", year);
	}
	
}
