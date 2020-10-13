package com.my.ERP.myInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.myInfo.model.vo.Message;
import com.my.ERP.myInfo.model.vo.Notice;

public interface MyinfoSerivce {

	ArrayList<Notice> NoticeForm();

	int NoticeInsert(String title, String text, String id);

	int NoticeModify(String title, String text, int no);

	int NoticeDelete(int no);

	ArrayList<Human> MsgFindMember(String mem);

	int MsgSend(HashMap<String, String> hs);

	ArrayList<Message> RecieverMsg(String user);

	ArrayList<Message> SendMsg(String user);

	Message recieverDetail(String mno);

	int NoReadMsg(String user);

	Message sendDetail(String mno);

	Message sendResend(String mno);

	int sendResendMsg(Message msg);

}
