package com.my.ERP.Human.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
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

	ArrayList<Human> searchPosition(String name, PageInfo pi);

	int postionListCount();

	ArrayList<Human> positionList(PageInfo pi);

	void addDept(Department dept);

	void delDept(String[] dnames);

	void modifyDept(Department dept, String beforeDeptName);

}
