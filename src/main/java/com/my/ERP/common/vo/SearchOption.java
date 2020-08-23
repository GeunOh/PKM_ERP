package com.my.ERP.common.vo;

public class SearchOption {
	private String all;
	private String inUser;
	private String outUser;
	private String dateAll;
	private String dateSelect;
	
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

	@Override
	public String toString() {
		return "SearchOption [all=" + all + ", inUser=" + inUser + ", outUser=" + outUser + ", dateAll=" + dateAll
				+ ", dateSelect=" + dateSelect + "]";
	}
	
}
