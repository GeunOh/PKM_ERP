package com.my.ERP.myInfo.model.vo;

import java.sql.Date;

public class Notice {
	private int bNo;
	private String title;
	private String writer;
	private String content;
	private Date create_date;
	private Date modify_date;
	private String outyn;
	
	public Notice () {}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getOutyn() {
		return outyn;
	}

	public void setOutyn(String outyn) {
		this.outyn = outyn;
	}

	@Override
	public String toString() {
		return "Notice [bNo=" + bNo + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", create_date=" + create_date + ", modify_date=" + modify_date + ", outyn=" + outyn + "]";
	}
	
}
