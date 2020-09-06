package com.my.ERP.Human.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.my.ERP.Human.model.vo.Department;
import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.Human.model.vo.PeopleCount;
import com.my.ERP.Human.model.vo.Rank;
import com.my.ERP.Human.model.vo.Salary;
import com.my.ERP.Human.model.vo.Vacation;
import com.my.ERP.Human.model.vo.WorkInOut;
import com.my.ERP.common.vo.PageInfo;
import com.my.ERP.common.vo.SearchOption;

@Repository("hDao")
public class HumanDAO {
	
	// 부서 목록 조회
	public ArrayList<Department> selectDepartmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("humanMapper.selectDepartmentList");
	}
	
	public int HumanListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.HumanListCount");
	}

	public ArrayList<Human> HumanList(SqlSessionTemplate sqlSession, PageInfo pi, String order) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.HumanList", order, rowBounds);
	}
	
	// 해당 부서 정보 조회
	public Department selectDepartment(String deptName, SqlSessionTemplate sqlSession) {
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
		return sqlSession.selectOne("humanMapper.selectPositionCount", name);
	}

	public ArrayList<Rank> searchPosition(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return (ArrayList)sqlSession.selectList("humanMapper.searchPosition", hs);
	}

	public int postionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.postionListCount");
	}

	public ArrayList<Rank> positionList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("humanMapper.positionList");
	}
	
	// 부서 등록
	public void addDept(SqlSessionTemplate sqlSession, Department dept) {
		sqlSession.insert("humanMapper.addDept", dept);
	}

	public void delDept(SqlSessionTemplate sqlSession, String[] dnames) {
		sqlSession.delete("humanMapper.delDept", dnames);
	}

	public void modifyDept(SqlSessionTemplate sqlSession, Department dept, String beforeDeptName) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("dcode", dept.getDcode());
		hs.put("dname", dept.getDname());
		hs.put("eno", dept.getEno());
		hs.put("dcomment", dept.getDcomment());
		hs.put("startDate", dept.getStartDate());
		hs.put("beforeDeptName", beforeDeptName);
		
		sqlSession.update("humanMapper.modifyDept", hs);
	}

	public void addPosition(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		sqlSession.insert("humanMapper.addPosition", hs);
	}

	public void deletePosition(SqlSessionTemplate sqlSession, String[] rcodeChk) {
		sqlSession.delete("humanMapper.deletePosition", rcodeChk);
	}

	public ArrayList<Human> choiceRcode(SqlSessionTemplate sqlSession, String rcode) {
		return (ArrayList)sqlSession.selectList("humanMapper.choiceRcode", rcode);
	}
	
	public int humanInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.insert("humanMapper.humanInsert", hs);
	}

	public int enoDupChk(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.selectOne("humanMapper.enoDupChk", eno);
	}

	public ArrayList<Department> humanAddDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("humanMapper.humanAddDeptList");
	}

	public ArrayList<Rank> humanAddRankList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("humanMapper.humanAddRankList");
	}

	public Human Login(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("humanMapper.Login", id);
	}
	
	public int dcodeDupChk(SqlSessionTemplate sqlSession, String dcode) {
		return sqlSession.selectOne("humanMapper.dcodeDupChk", dcode);
	}

	public ArrayList<Vacation> vacationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 마이바티스에서 제공하는 RowBounds 객체를 사용합니다. 파라미터로 가져오고싶은 구간을 설정합니다.
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.vacationList", null, rowBounds);
	}

	public int approvalVacation(SqlSessionTemplate sqlSession, String[] vnoList) {
		return sqlSession.update("humanMapper.approvalVacation", vnoList);
	}

	public int refuseVacation(SqlSessionTemplate sqlSession, String[] vnoList) {
		return sqlSession.update("humanMapper.refuseVacation", vnoList);
	}

	public ArrayList<Vacation> searchVacationList(SqlSessionTemplate sqlSession, HashMap<String, Object> hs, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.searchVacationList", hs, rowBounds);
	}

	public int vacationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.vacationListCount");
	}

	public int searchVacationListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.selectOne("humanMapper.searchVacationListCount",hs);
	}

	public Human humanModifyInfo(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.selectOne("humanMapper.humanModifyInfo", eno);
	}
	
	public int addVacation(SqlSessionTemplate sqlSession, Vacation vacation) {
		return sqlSession.insert("humanMapper.addVacation", vacation);
	}

	public int showVacationDays(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.selectOne("humanMapper.showVacationDays", eno);
	}

	public ArrayList<Human> departHumanShow(SqlSessionTemplate sqlSession, String deptName) {
		return (ArrayList)sqlSession.selectList("humanMapper.departStudentShow", deptName);
	}

	public int rcodeDupChk(SqlSessionTemplate sqlSession, String rcode) {
		return sqlSession.selectOne("humanMapper.rcodeDupChk", rcode);
	}

	public int WorkTimeIn(SqlSessionTemplate sqlSession, String eno, String type) {
		
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("eno", eno);
		hs.put("type", type);
		
		return sqlSession.insert("humanMapper.WorkTimeIn", hs);
	}
	
	public Rank positonModifyInfo(SqlSessionTemplate sqlSession, String rcode) {
		return sqlSession.selectOne("humanMapper.positonModifyInfo", rcode);
	}

	public int modifyPositon(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.update("humanMapper.modifyPositon", hs);
	}

	public ArrayList<WorkInOut> workList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit()  ;
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.workList", null, rowBounds);
	}

	public ArrayList<WorkInOut> enoWorkList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*5;
		RowBounds rowBounds = new RowBounds(offset, 5);
		return (ArrayList)sqlSession.selectList("humanMapper.enoWorkList", null, rowBounds);
	}

	public int workListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.workListCount");
	}

	public int SearchWorkCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hs) {
		return sqlSession.selectOne("humanMapper.SearchWorkCount", hs);
	}

	public ArrayList<WorkInOut> SearchWorkList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> hs) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("humanMapper.SearchWorkList", hs, rowBounds);
	}

	public ArrayList<WorkInOut> SearchWorkEnoList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, Object> hs) {
		
		int offset = (pi.getCurrentPage()-1)*5;
		RowBounds rowBounds = new RowBounds(offset, 5);
		
		return (ArrayList)sqlSession.selectList("humanMapper.SearchWorkEnoList", hs, rowBounds);
	}

	public PeopleCount WorkPeopleCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.WorkPeopleCount");
	}

	public ArrayList<Salary> salaryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("humanMapper.salaryList", null, rowbounds);
	}

	public int salaryListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("humanMapper.salaryListCount");
	}

	public WorkInOut WorkSysdate(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.selectOne("humanMapper.WorkSysdate", eno);
	}

	public int WorkTimeOut(SqlSessionTemplate sqlSession, String eno) {
		return sqlSession.update("humanMapper.WorkTimeOut", eno);
	}

	public int HumanManagerModify(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.update("humanMapper.HumanManagerModify", hs);
	}

	public int HumanManagerDelete(SqlSessionTemplate sqlSession, HashMap<String, String> hs) {
		return sqlSession.update("humanMapper.HumanManagerDelete", hs);
	}


}
