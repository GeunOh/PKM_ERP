package com.my.ERP.Human.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

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

	public int SearchHumanListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.selectOne("humanMapper.SearchHumanListCount", hs);
	}

	public ArrayList<Human> SearchHumanList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> hs) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("humanMapper.SearchHumanList", hs, rowBounds);
	}

	public int selectPositionCount(SqlSessionTemplate sqlSession, String name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("humanMapper.selectPositionCount", name);
	}

	public ArrayList<Human> searchPosition(SqlSessionTemplate sqlSession, String name, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("humanMapper.searchPosition", name, rowBounds);
	}

	public int postionListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("humanMapper.postionListCount");
	}

	public ArrayList<Human> positionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("humanMapper.positionList", null, rowBounds);
	}
	
	// 부서 등록
	public void addDept(SqlSessionTemplate sqlSession, Department dept) {
		// TODO Auto-generated method stub
		sqlSession.insert("humanMapper.addDept", dept);
	}

	public void delDept(SqlSessionTemplate sqlSession, String[] dnames) {
		// TODO Auto-generated method stub
		sqlSession.delete("humanMapper.delDept", dnames);
	}

	public void modifyDept(SqlSessionTemplate sqlSession, Department dept, String beforeDeptName) {
		// TODO Auto-generated method stub
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("dcode", dept.getDcode());
		hs.put("dname", dept.getDname());
		hs.put("eno", dept.getEno());
		hs.put("dcomment", dept.getDcomment());
		hs.put("startDate", dept.getStartDate());
		hs.put("beforeDeptName", beforeDeptName);
		
		sqlSession.update("humanMapper.modifyDept", hs);
	}

}
