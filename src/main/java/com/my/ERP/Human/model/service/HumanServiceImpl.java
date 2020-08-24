package com.my.ERP.Human.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.dao.HumanDAO;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.Rank;
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
	public ArrayList<Rank> searchPosition(HashMap<String, String> hs) {
		// TODO Auto-generated method stub
		return hDAO.searchPosition(sqlSession, hs);
	}

	@Override
	public int postionListCount() {
		// TODO Auto-generated method stub
		return hDAO.postionListCount(sqlSession);
	}

	@Override
	public ArrayList<Rank> positionList() {
		// TODO Auto-generated method stub
		return hDAO.positionList(sqlSession);
	}
	
	// 부서 등록 서비스
	@Override
	public void addDept(Department dept) {
		// TODO Auto-generated method stub
		hDAO.addDept(sqlSession, dept);
	}
	
	// 부서 삭제 서비스
	@Override
	public void delDept(String[] dnames) {
		// TODO Auto-generated method stub
		hDAO.delDept(sqlSession, dnames);
	}
	
	// 부서 정보 수정 서비스
	@Override
	public void modifyDept(Department dept, String beforeDeptName) {
		// TODO Auto-generated method stub
		hDAO.modifyDept(sqlSession, dept, beforeDeptName);
	}
	
	// 직급 추가 서비스
	@Override
	public void addPosition(HashMap<String, String> hs) {
		// TODO Auto-generated method stub
		hDAO.addPosition(sqlSession, hs);
	}
	
	// 직급 삭제 서비스
	@Override
	public void deletePosition(String[] rcodeChk) {
		// TODO Auto-generated method stub
		hDAO.deletePosition(sqlSession, rcodeChk);
	}

	@Override
	public int humanInsert(HashMap<String, Object> hs) {
		return hDAO.humanInsert(sqlSession, hs);
	}
	
	// 직급 목록 선택 시 사원 목록 조회
	@Override
	public ArrayList<Human> choiceRcode(String rcode) {
		// TODO Auto-generated method stub
		return hDAO.choiceRcode(sqlSession, rcode);
	}

	@Override
	public int enoDupChk(String eno) {
		return hDAO.enoDupChk(sqlSession, eno);
	}

	@Override
	public ArrayList<Department> humanAddDeptList() {
		return hDAO.humanAddDeptList(sqlSession);
	}

	@Override
	public ArrayList<Rank> humanAddRankList() {
		return hDAO.humanAddRankList(sqlSession);
	}
	
}
