package com.my.ERP.myInfo.model.vo;

public class Caleander {
	private String start;
	private String title;

	public String getStart() {
		return start;
	}

	public void setStart(String worktime) {
		this.start = worktime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Caleander [worktime=" + start + ", title=" + title + "]";
	}

}
