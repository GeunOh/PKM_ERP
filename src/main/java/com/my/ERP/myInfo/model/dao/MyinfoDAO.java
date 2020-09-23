package com.my.ERP.myInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
