package com.my.ERP.Human.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.dao.HumanDAO;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

@Service("hService")
public class HumanServiceImpl implements HumanService {
	
	@Autowired
	private HumanDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 부서 목록 조회
	@Override
	public ArrayList<Department> showDepartmentList() {
		// TODO Auto-generated method stub
		return hDAO.selectDepartmentList(sqlSession);
	}
	
	@Override
	public int HumanListCount() {
		return hDAO.HumanListCount(sqlSession);
	}

	@Override
	public ArrayList<Human> HumanList(PageInfo pi) {
		return hDAO.HumanList(sqlSession, pi);
	}

	@Override
	public int SearchHumanListCount(HashMap<String, Object> hs) {
		return hDAO.SearchHumanListCount(sqlSession, hs);
	}

	@Override
	public ArrayList<Human> SearchHumanList(PageInfo pi, HashMap<String, Object> hs) {
		return hDAO.SearchHumanList(sqlSession, pi, hs);
	}
	
	// 해당 부서 정보 조회
	@Override
	public Department showDepartment(String deptName) {
		// TODO Auto-generated method stub
		return hDAO.selectDepartment(deptName, sqlSession);
	}

	@Override
	public int searchPositionCount(String name) {
		// TODO Auto-generated method stub
		return hDAO.selectPositionCount(sqlSession, name);
	}

	@Override
	public ArrayList<Human> searchPosition(String name, PageInfo pi) {
		// TODO Auto-generated method stub
		return hDAO.searchPosition(sqlSession, name, pi);
	}

	@Override
	public int postionListCount() {
		// TODO Auto-generated method stub
		return hDAO.postionListCount(sqlSession);
	}

	@Override
	public ArrayList<Human> positionList(PageInfo pi) {
		// TODO Auto-generated method stub
		return hDAO.positionList(sqlSession, pi);
	}
	
}
