package com.my.ERP.Human.model.vo;

import java.sql.Date;

public class Salary {
	
	private String eno;
	private String dname;
	private String rname;
	private String ename;
	private Date indate;
	private String salary;
	
	public Salary() {}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
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

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Salary [eno=" + eno + ", dname=" + dname + ", rname=" + rname + ", ename=" + ename + ", indate="
				+ indate + ", salary=" + salary + "]";
	}
	
	
	
}
