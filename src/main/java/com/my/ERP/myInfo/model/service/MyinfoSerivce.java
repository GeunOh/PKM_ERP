package com.my.ERP.myInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.myInfo.model.vo.Notice;

public interface MyinfoSerivce {

	ArrayList<Notice> NoticeForm();

	int NoticeInsert(String title, String text, String id);

	int NoticeModify(String title, String text, int no);

	int NoticeDelete(int no);

	int insertFile(HashMap<String, Object> fileHs);

	Notice selectNotice(String bNo);

	ArrayList<Integer> vacationUseDays(String eno);


}
