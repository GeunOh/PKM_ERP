package com.my.ERP.myInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.myInfo.model.dao.MyinfoDAO;
import com.my.ERP.myInfo.model.vo.Message;
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
	public ArrayList<Human> MsgFindMember(String mem) {
		return mDAO.MsgFindMember(sqlSession, mem);
	}

	@Override
	public int MsgSend(HashMap<String, String> hs) {
		return mDAO.MsgSend(sqlSession, hs);
	}

	@Override
	public ArrayList<Message> RecieverMsg(String user) {
		return mDAO.RecieverMsg(sqlSession, user);
	}

	@Override
	public ArrayList<Message> SendMsg(String user) {
		return mDAO.SendMsg(sqlSession, user);
	}

	@Override
	public Message recieverDetail(String mno) {
		mDAO.recieverReadChk(sqlSession, mno);
		return mDAO.recieverDetail(sqlSession, mno);
	}

	@Override
	public int NoReadMsg(String user) {
		return mDAO.NoReadMsg(sqlSession, user);
	}

	@Override
	public Message sendDetail(String mno) {
		return mDAO.sendDetail(sqlSession, mno);
	}

	@Override
	public Message sendResend(String mno) {
		return mDAO.sendResend(sqlSession, mno);
	}

	@Override
	public int sendResendMsg(Message msg) {
		return mDAO.sendResendMsg(sqlSession, msg);
	}

}
