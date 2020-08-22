package com.my.ERP.Human.model.vo;

public class Department {
	
	// 필드
	private String dcode;	
	private String dname;	
	private String dcomment;
	
	public Department() {}	// 기본 생성자
	
	// get, set 메서드
	public String getDcode() {
		return dcode;
	}

	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDcomment() {
		return dcomment;
	}

	public void setDcomment(String dcomment) {
		this.dcomment = dcomment;
	}

	@Override
	public String toString() {
		return "Department [dcode=" + dcode + ", dname=" + dname + ", dcomment=" + dcomment + "]";
	}
	
	
	
}
