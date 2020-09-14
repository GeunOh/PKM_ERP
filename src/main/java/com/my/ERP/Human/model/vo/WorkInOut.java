package com.my.ERP.Human.model.vo;

public class WorkInOut {
	private String eno;
	private String name;
	private String rname;
	private String dname;
	private String date;
	private String intime;
	private String outtime;
	private String worktime;
	private String type;
	
	public WorkInOut() {}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getIntime() {
		return intime;
	}

	public void setIntime(String intime) {
		this.intime = intime;
	}

	public String getOuttime() {
		return outtime;
	}

	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "WorkInOut [eno=" + eno + ", name=" + name + ", rname=" + rname + ", dname=" + dname + ", date=" + date
				+ ", intime=" + intime + ", outtime=" + outtime + ", worktime=" + worktime + ", type=" + type + "]";
	}

}
