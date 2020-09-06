package com.my.ERP.Human.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.dao.HumanDAO;
import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.PeopleCount;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.Human.model.vo.Salary;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.Human.model.vo.WorkInOut;
import com.my.ERP.common.vo.PageInfo;

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
	public ArrayList<Human> HumanList(PageInfo pi, String order) {
		return hDAO.HumanList(sqlSession, pi, order);
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
	public Department departmentShow(String deptName) {
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
		return hDAO.searchVacationListCount(sqlSession, hs);
	}

	@Override
	public Human humanModifyInfo(String eno) {
		return hDAO.humanModifyInfo(sqlSession, eno);
	}
	
	// 마이페이지 - 휴가 신청
	@Override
	public int addVacation(Vacation vacation) {
		return hDAO.addVacation(sqlSession, vacation);
	}
	
	// 마이페이지 - 휴가 개수 가져오기
	@Override
	public int showVacationDays(String eno) {
		return hDAO.showVacationDays(sqlSession, eno);
	}
	
	// 부서관리 - 해당 부서 사원 목록 가져오기
	@Override
	public ArrayList<Human> departHumanShow(String deptName) {
		return hDAO.departHumanShow(sqlSession, deptName);
	}
	
	// 직급관리 - 직급 추가 시 직급번호 중복확인
	@Override
	public int rcodeDupChk(String rcode) {
		return hDAO.rcodeDupChk(sqlSession, rcode);
	}

	@Override
	public int WorkTimeIn(String eno, String type) {
		return hDAO.WorkTimeIn(sqlSession, eno, type);
	}
	
	// 직급관리 - 직급 수정시 해당 직급정보 가져오기
	@Override
	public Rank positonModifyInfo(String rcode) {
		return hDAO.positonModifyInfo(sqlSession, rcode);
	}
	
	// 직급 수정하기(서비스)
	@Override
	public int modifyPositon(HashMap<String, String> hs) {
		return hDAO.modifyPositon(sqlSession, hs);
	}

	@Override
	public ArrayList<WorkInOut> workList(PageInfo pi) {
		return hDAO.workList(sqlSession, pi);
	}

	@Override
	public ArrayList<WorkInOut> enoWorkList(PageInfo pi) {
		return hDAO.enoWorkList(sqlSession, pi);
	}

	@Override
	public int workListCount() {
		return hDAO.workListCount(sqlSession);
	}

	@Override
	public int SearchWorkCount(HashMap<String, Object> hs) {
		return hDAO.SearchWorkCount(sqlSession, hs);
	}

	@Override
	public ArrayList<WorkInOut> SearchWorkList(PageInfo pi, HashMap<String, Object> hs) {
		return hDAO.SearchWorkList(sqlSession, pi, hs);
	}

	@Override
	public ArrayList<WorkInOut> SearchWorkEnoList(PageInfo pi, HashMap<String, Object> hs) {
		return hDAO.SearchWorkEnoList(sqlSession, pi, hs);
	}

	@Override
	public PeopleCount WorkPeopleCount() {
		return hDAO.WorkPeopleCount(sqlSession);
	}
	
	// 급여 관리 목록
	@Override
	public ArrayList<Salary> salaryList(PageInfo pi) {
		return hDAO.salaryList(sqlSession, pi);
	}
	
	// 급여 관리 목록 개수
	@Override
	public int salaryListCount() {
		return hDAO.salaryListCount(sqlSession);
	}
	
	// 급여 검색 목록 개수
	@Override
	public int searchSalaryListCount(HashMap<String, Object> hs) {
		return hDAO.searchSalaryListCount(sqlSession, hs);
	}
	
	// 급여 목록 검색
	@Override
	public ArrayList<Salary> searchSalaryList(HashMap<String, Object> hs, PageInfo pi) {
		return hDAO.searchSalaryList(sqlSession, hs, pi);
	}
	
	// 수정 할 급여 정보
	@Override
	public Salary salaryModifyInfo(String eno) {
		return hDAO.salaryModifyInfo(sqlSession, eno);
	}
	
	// 급여 수정
	@Override
	public int modifySalary(String salary, String eno) {
		return hDAO.modifySalary(sqlSession, salary, eno);
	}

	@Override
	public WorkInOut WorkSysdate(String eno) {
		return hDAO.WorkSysdate(sqlSession, eno);
	}

	@Override
	public int WorkTimeOut(String eno) {
		return hDAO.WorkTimeOut(sqlSession, eno);
	}

	@Override
	public int HumanManagerModify(HashMap<String, String> hs) {
		return hDAO.HumanManagerModify(sqlSession, hs);
	}

	@Override
	public int HumanManagerDelete(HashMap<String, String> hs) {
		return hDAO.HumanManagerDelete(sqlSession, hs);
	}

	@Override
	public ArrayList<Human> ExcelHumanList() {
		return hDAO.ExcelHumanList(sqlSession);
	}

	
	
}
