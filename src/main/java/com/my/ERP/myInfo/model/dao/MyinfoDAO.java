package com.my.ERP.myInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.myInfo.model.vo.Notice;

@Repository
public class MyinfoDAO {

	public ArrayList<Notice> NoticeForm(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.NoticeForm");
	}

	public int NoticeInsert(SqlSessionTemplate sqlSession, String title, String text, String id) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("title", title);
		hs.put("text", text);
		hs.put("id", id);
		return sqlSession.insert("noticeMapper.NoticeInsert",hs);
	}

	public int NoticeModify(SqlSessionTemplate sqlSession, String title, String text, int no) {
		HashMap<String, Object> hs = new HashMap<String, Object>();
		hs.put("title", title);
		hs.put("text", text);
		hs.put("no", no);
		
		return sqlSession.update("noticeMapper.NoticeModify",hs);
	}

	public int NoticeDelete(SqlSessionTemplate sqlSession, int no) {
		
		return sqlSession.update("noticeMapper.NoticeDelete", no);
	}

	public int insertFile(SqlSessionTemplate sqlSession, HashMap<String, Object> fileHs) {
		return sqlSession.insert("noticeMapper.insertFile", fileHs);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, String bNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", bNo);
	}

	public HashMap<String, Integer> vacationUseDays(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.selectOne("noticeMapper.vacationUseDays", eno);
	}

	public ArrayList<Vacation> myVacationList(SqlSessionTemplate sqlSession, String eno) {
		return (ArrayList)sqlSession.selectList("noticeMapper.myVacationList", eno);
	}

}
