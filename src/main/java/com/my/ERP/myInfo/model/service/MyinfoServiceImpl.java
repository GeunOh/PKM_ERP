package com.my.ERP.myInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.myInfo.model.dao.MyinfoDAO;
import com.my.ERP.myInfo.model.vo.Notice;

@Service
public class MyinfoServiceImpl implements MyinfoSerivce{
	
	@Autowired
	private MyinfoDAO mDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> NoticeForm() {
		return mDAO.NoticeForm(sqlSession);
	}

	@Override
	public int NoticeInsert(String title, String text, String id) {
		return mDAO.NoticeInsert(sqlSession, title, text, id);
	}

	@Override
	public int NoticeModify(String title, String text, int no) {
		return mDAO.NoticeModify(sqlSession, title, text, no);
	}

	@Override
	public int NoticeDelete(int no) {
		return mDAO.NoticeDelete(sqlSession, no);
	}

	@Override
	public int insertFile(HashMap<String, Object> fileHs) {
		return mDAO.insertFile(sqlSession, fileHs);
	}

	@Override
	public Notice selectNotice(String bNo) {
		return mDAO.selectNotice(sqlSession, bNo);
	}


}
