package com.my.ERP.common.vo;

public class SearchOption {
	private String all;
	private String inUser;
	private String outUser;
	private String dateAll;
	private String dateSelect;
	
	private String wait;
	private String no;
	private String ok;
	
	private String dateRequest;
	private String dateStart;
	private String dateEnd;
	
	public SearchOption() {}

	public String getAll() {
		return all;
	}

	public void setAll(String all) {
		this.all = all;
	}

	public String getInUser() {
		return inUser;
	}

	public void setInUser(String inUser) {
		this.inUser = inUser;
	}

	public String getOutUser() {
		return outUser;
	}

	public void setOutUser(String outUser) {
		this.outUser = outUser;
	}

	public String getDateAll() {
		return dateAll;
	}

	public void setDateAll(String dateAll) {
		this.dateAll = dateAll;
	}

	public String getDateSelect() {
		return dateSelect;
	}

	public void setDateSelect(String dateSelect) {
		this.dateSelect = dateSelect;
	}

	public String getWait() {
		return wait;
	}

	public void setWait(String wait) {
		this.wait = wait;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}

	public String getDateRequest() {
		return dateRequest;
	}

	public void setDateRequest(String dateRequest) {
		this.dateRequest = dateRequest;
	}

	public String getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

	@Override
	public String toString() {
		return "SearchOption [all=" + all + ", inUser=" + inUser + ", outUser=" + outUser + ", dateAll=" + dateAll
				+ ", dateSelect=" + dateSelect + ", wait=" + wait + ", no=" + no + ", ok=" + ok + "]";
	}

	
}
