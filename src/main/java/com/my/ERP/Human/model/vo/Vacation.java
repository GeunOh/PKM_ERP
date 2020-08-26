package com.my.ERP.Human.model.vo;

import java.sql.Date;

public class Vacation {
	
	// 필드
	private int vno;			 // 시퀀스
    private String eno;    		 // 사원 번호    
    private String vType;        // 휴가 종류
    private Date startDate;		 // 시작일
    private Date endDate;		 // 종료일
    private String reason;		 // 휴가 사유
    private Date requestDate;	 // 신청일
    private String status;		 // 휴가 처리 상태
    private String useDay;		 // 휴가 사용일수
   
    private String dname;	// 부서명
    private String rname;	// 직급명
    
	// 생성자
	public Vacation() {}
	
	// get, set()
    public int getVno() {
		return vno;
	}

	public void setVno(int vno) {
		this.vno = vno;
	}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}

	public String getvType() {
		return vType;
	}

	public void setvType(String vType) {
		this.vType = vType;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUseDay() {
		return useDay;
	}

	public void setUseDay(String useDay) {
		this.useDay = useDay;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Override
	public String toString() {
		return "Vacation [vno=" + vno + ", eno=" + eno + ", vType=" + vType + ", startDate=" + startDate + ", endDate="
				+ endDate + ", reason=" + reason + ", requestDate=" + requestDate + ", status=" + status + ", useDay="
				+ useDay + ", dname=" + dname + ", rname=" + rname + "]";
	}

	

	

	
}
