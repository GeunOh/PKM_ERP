package com.my.ERP.myInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.myInfo.model.vo.Message;
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

	public ArrayList<Human> MsgFindMember(SqlSessionTemplate sqlSession, String mem) {
		return (ArrayList)sqlSession.selectList("noticeMapper.MsgFindMember", mem);
	}

	public int MsgSend(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.insert("noticeMapper.MsgSend", hs);
	}

	public ArrayList<Message> RecieverMsg(SqlSessionTemplate sqlSession, String user) {
		return (ArrayList)sqlSession.selectList("noticeMapper.RecieverMsg", user);
	}

	public ArrayList<Message> SendMsg(SqlSessionTemplate sqlSession, String user) {
		return (ArrayList)sqlSession.selectList("noticeMapper.SendMsg", user);
	}

	public Message recieverDetail(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.selectOne("noticeMapper.recieverDetail", mno);
	}

	public int NoReadMsg(SqlSessionTemplate sqlSession, String user) {
		return sqlSession.selectOne("noticeMapper.NoReadMsg", user);
	}

	public Message sendDetail(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.selectOne("noticeMapper.sendDetail", mno);
	}

	public void recieverReadChk(SqlSessionTemplate sqlSession, String mno) {
		sqlSession.update("noticeMapper.recieverReadChk", mno);
	}

	public Message sendResend(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.selectOne("noticeMapper.sendResend", mno);
	}

	public int sendResendMsg(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("noticeMapper.sendResendMsg",msg);
	}

}
