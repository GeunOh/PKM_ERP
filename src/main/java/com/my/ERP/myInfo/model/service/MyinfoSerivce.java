package com.my.ERP.myInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.Stock.model.vo.Supply;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.myInfo.model.vo.Message;
import com.my.ERP.myInfo.model.vo.Notice;

public interface MyinfoSerivce {

	ArrayList<Notice> NoticeForm();

	int NoticeInsert(String title, String text, String id);

	int NoticeModify(String title, String text, int no);

	int NoticeDelete(int no);
	
	int insertFile(HashMap<String, Object> fileHs);

	Notice selectNotice(String bNo);

	HashMap<String, Integer> vacationUseDays(String eno);

	ArrayList<Vacation> myVacationList(String eno, PageInfo pi);

	int myVacationListCount(String eno);

	int addSupplyRequest(HashMap<String, String> hs);

	HashMap<String, String> totalCount(String eno);

	List<HashMap<String, String>> supplyRequestList(String eno, PageInfo pi);

	List<Supply> supplyList();

	int addProductInOut(HashMap<String, String> hs);
	
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
