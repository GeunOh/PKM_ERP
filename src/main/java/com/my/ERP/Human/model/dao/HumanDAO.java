package com.my.ERP.Human.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Department;

@Repository("hDao")
public class HumanDAO {

	public ArrayList<Department> selectDepartment(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("humanMapper.selectDepartment");
	}

}
