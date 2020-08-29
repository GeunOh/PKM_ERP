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
import com.my.ERP.Human.model.vo.Vacation;
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
		return hDAO.selectDepartment(deptName, sqlSession);
	}

	@Override
	public int searchPositionCount(String name) {
		return hDAO.selectPositionCount(sqlSession, name);
	}

	@Override
	public ArrayList<Rank> searchPosition(HashMap<String, String> hs) {
		return hDAO.searchPosition(sqlSession, hs);
	}

	@Override
	public int postionListCount() {
		return hDAO.postionListCount(sqlSession);
	}

	@Override
	public ArrayList<Rank> positionList() {
		return hDAO.positionList(sqlSession);
	}
	
	// 부서 등록 서비스
	@Override
	public void addDept(Department dept) {
		hDAO.addDept(sqlSession, dept);
	}
	
	// 부서 삭제 서비스
	@Override
	public void delDept(String[] dnames) {
		hDAO.delDept(sqlSession, dnames);
	}
	
	// 부서 정보 수정 서비스
	@Override
	public void modifyDept(Department dept, String beforeDeptName) {
		hDAO.modifyDept(sqlSession, dept, beforeDeptName);
	}
	
	// 직급 추가 서비스
	@Override
	public void addPosition(HashMap<String, String> hs) {
		hDAO.addPosition(sqlSession, hs);
	}
	
	// 직급 삭제 서비스
	@Override
	public void deletePosition(String[] rcodeChk) {
		hDAO.deletePosition(sqlSession, rcodeChk);
	}

	@Override
	public int humanInsert(HashMap<String, Object> hs) {
		return hDAO.humanInsert(sqlSession, hs);
	}
	
	// 직급 목록 선택 시 사원 목록 조회
	@Override
	public ArrayList<Human> choiceRcode(String rcode) {
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

	@Override
	public Human Login(String id) {
		return hDAO.Login(sqlSession, id);
	}
	
	// 부서 수정시 부서번호 중복체크
	@Override
	public int dcodeDupChk(String dcode) {
		return hDAO.dcodeDupChk(sqlSession, dcode);
	}
	
	// 휴가신청목록 조회
	@Override
	public ArrayList<Vacation> vacationList(PageInfo pi) {
		return hDAO.vacationList(sqlSession, pi);
	}

	// 휴가신청 승인
	@Override
	public int approvalVacation(String[] vnoList) {
		return hDAO.approvalVacation(sqlSession, vnoList);
	}
	
	// 휴가신청 거절
	@Override
	public int refuseVacation(String[] vnoList) {
		return hDAO.refuseVacation(sqlSession, vnoList);
	}
	
	// 휴가 검색 후 목록
	@Override
	public ArrayList<Vacation> searchVacationList(HashMap<String, Object> hs, PageInfo pi) {
		return hDAO.searchVacationList(sqlSession, hs, pi);
	}
	
	// 휴가 목록 전체 행 개수
	@Override
	public int vacationListCount() {
		return hDAO.vacationListCount(sqlSession);
	}
	
	// 휴가 검색 결과 행 개수
	@Override
	public int searchVacationListCount(HashMap<String, Object> hs) {
		// TODO Auto-generated method stub
		return hDAO.searchVacationListCount(sqlSession, hs);
	}

	@Override
	public Human humanModifyInfo(String eno) {
		return hDAO.humanModifyInfo(sqlSession, eno);
	}
	
}
