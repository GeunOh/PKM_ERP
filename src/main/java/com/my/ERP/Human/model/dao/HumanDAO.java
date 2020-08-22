package com.my.ERP.Human.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.vo.PageInfo;

@Repository("hDao")
public class HumanDAO {
	
	// 부서 목록 조회
	public ArrayList<Department> selectDepartmentList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("humanMapper.selectDepartmentList");
	}
	
	public int HumanListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.HumanListCount");
	}

	public ArrayList<Human> HumanList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.HumanList", null, rowBounds);
	}
	
	// 해당 부서 정보 조회
	public Department selectDepartment(String deptName, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("humanMapper.selectDepartment", deptName);
	}

}
