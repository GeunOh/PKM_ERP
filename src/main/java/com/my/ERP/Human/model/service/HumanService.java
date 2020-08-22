package com.my.ERP.Human.model.service;

import java.util.ArrayList;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

public interface HumanService {

	ArrayList<Department> showDepartmentList();
	
	int HumanListCount();

	ArrayList<Human> HumanList(PageInfo pi);

	Department showDepartment(String deptName);
	
	int SearchHumanListCount(SearchOption so);

	ArrayList<Human> SearchHumanList(PageInfo pi, SearchOption so);

}
