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
	
	private String org_file_name;
	private int file_size;
	
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

	public String getOrg_file_name() {
		return org_file_name;
	}

	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	@Override
	public String toString() {
		return "Notice [bNo=" + bNo + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", create_date=" + create_date + ", modify_date=" + modify_date + ", outyn=" + outyn
				+ ", org_file_name=" + org_file_name + ", file_size=" + file_size + "]";
	}

	
}
