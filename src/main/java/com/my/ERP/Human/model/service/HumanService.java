package com.my.ERP.Human.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

public interface HumanService {

	ArrayList<Department> showDepartmentList();
	
	int HumanListCount();

	ArrayList<Human> HumanList(PageInfo pi);

	Department showDepartment(String deptName);
	
	int SearchHumanListCount(HashMap<String, Object> hs);

	ArrayList<Human> SearchHumanList(PageInfo pi, HashMap<String, Object> hs);

	int searchPositionCount(String name);

	ArrayList<Rank> searchPosition(HashMap<String, String> hs);

	int postionListCount();

	ArrayList<Rank> positionList();

	void addDept(Department dept);

	void delDept(String[] dnames);

	void modifyDept(Department dept, String beforeDeptName);

	void addPosition(HashMap<String, String> hs);

	void deletePosition(String[] rcodeChk);

	ArrayList<Human> choiceRcode(String rcode);

	int humanInsert(HashMap<String, Object> hs);

	int enoDupChk(String eno);

	ArrayList<Department> humanAddDeptList();

	ArrayList<Rank> humanAddRankList();

	Human Login(String id);
	
	int dcodeDupChk(String dcode);

	ArrayList<Vacation> vacationList(PageInfo pi);

	int approvalVacation(String[] vnoList);

	int refuseVacation(String[] vnoList);

	ArrayList<Vacation> searchVacationList(HashMap<String, Object> hs);

	int vacationListCount();

}
