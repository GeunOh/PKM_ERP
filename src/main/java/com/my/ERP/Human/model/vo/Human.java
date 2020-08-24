package com.my.ERP.Human.model.vo;

import java.sql.Date;

public class Human {

	// 필드
	private String eno;
	private String pwd;
	private String name;
	private Date birthday;
	private String address;
	private String email;
	private String phone;
	private String gender;
	private Date indate;
	private String outdate;
	private String outyn;
	private String rcode;
	private String dcode;
	private String originalFileName;
	private String renameFileName;

	public Human() {
	} // 기본생성자

	// get, set 메서드
	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}

	public String getOutyn() {
		return outyn;
	}

	public void setOutyn(String outyn) {
		this.outyn = outyn;
	}

	public String getRcode() {
		return rcode;
	}

	public void setRcode(String rcode) {
		this.rcode = rcode;
	}

	public String getDcode() {
		return dcode;
	}

	public void setDcode(String dcode) {
		this.dcode = dcode;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	@Override
	public String toString() {
		return "Human [eno=" + eno + ", pwd=" + pwd + ", name=" + name + ", birthday=" + birthday + ", address="
				+ address + ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", indate=" + indate
				+ ", outdate=" + outdate + ", outyn=" + outyn + ", rcode=" + rcode + ", dcode=" + dcode
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + "]";
	}

}
