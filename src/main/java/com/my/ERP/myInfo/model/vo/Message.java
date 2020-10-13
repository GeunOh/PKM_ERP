package com.my.ERP.myInfo.model.vo;

public class Message {
	private int mno;
	private String title;
	private String writer;
	private String reciever;
	private String name;
	private String rname;
	private String dname;
	private String profile;
	private String bcontent;
	private String mread;
	private String createDate;
	
	public Message() {}
	
	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
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

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getMread() {
		return mread;
	}

	public void setMread(String mread) {
		this.mread = mread;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Message [mno=" + mno + ", title=" + title + ", writer=" + writer + ", reciever=" + reciever + ", name="
				+ name + ", rname=" + rname + ", dname=" + dname + ", profile=" + profile + ", bcontent=" + bcontent
				+ ", mread=" + mread + ", createDate=" + createDate + "]";
	}
	
}
