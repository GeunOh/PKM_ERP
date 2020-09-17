package com.my.ERP.Stock.model.vo;

public class Client {
	private String ccode;
	private String cname;
	private String cmanager;
	private String cphone;
	private String c_comment;
	
	public Client() {}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCmanager() {
		return cmanager;
	}

	public void setCmanager(String cmanager) {
		this.cmanager = cmanager;
	}

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getC_comment() {
		return c_comment;
	}

	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	@Override
	public String toString() {
		return "Client [ccode=" + ccode + ", cname=" + cname + ", cmanager=" + cmanager + ", cphone=" + cphone
				+ ", c_comment=" + c_comment + "]";
	}

}
