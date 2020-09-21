package com.my.ERP.Stock.model.vo;

public class Supply {
	
	private String scode;
	private String sname;
	private String cost_price;
	private String s_comment;
	private String scount;
	
	public Supply() {}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getCost_price() {
		return cost_price;
	}

	public void setCost_price(String cost_price) {
		this.cost_price = cost_price;
	}

	public String getS_comment() {
		return s_comment;
	}

	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}

	public String getScount() {
		return scount;
	}

	public void setScount(String scount) {
		this.scount = scount;
	}

	@Override
	public String toString() {
		return "Supply [scode=" + scode + ", sname=" + sname + ", cost_price=" + cost_price + ", s_comment=" + s_comment
				+ ", scount=" + scount + "]";
	}
	
	
}
