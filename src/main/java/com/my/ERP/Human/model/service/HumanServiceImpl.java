package com.my.ERP.Human.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.dao.HumanDAO;
import com.my.ERP.Human.model.vo.Department;

@Service("hService")
public class HumanServiceImpl implements HumanService {
	
	@Autowired
	private HumanDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 부서 조회
	@Override
	public ArrayList<Department> showDepartment() {
		// TODO Auto-generated method stub
		return hDAO.selectDepartment(sqlSession);
	}
	
}
