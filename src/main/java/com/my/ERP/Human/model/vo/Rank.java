package com.my.ERP.Human.model.vo;

public class Rank {
	
	// 필드
	private String rcode;
	private String rname;
	
	public Rank() {}	// 기본 생성자
	
	// get, set()
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	@Override
	public String toString() {
		return "Rank [rcode=" + rcode + ", rname=" + rname + "]";
	}
	
}
