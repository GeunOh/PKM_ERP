package com.my.ERP.Human.model.vo;

public class WorkInOut {
	private String eno;
	private String date;
	private String intime;
	private String outtime;
	private String type;
	
	public WorkInOut() {}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "WorkInOut [eno=" + eno + ", date=" + date + ", intime=" + intime + ", outtime=" + outtime + ", type="
				+ type + "]";
	}
	
	
}
