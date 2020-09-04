package com.my.ERP.Human.model.vo;

public class PeopleCount {
	private int peopleAll;
	private int peopleIn;
	private int peopleOut;
	
	public PeopleCount() {}

	public int getPeopleAll() {
		return peopleAll;
	}

	public void setPeopleAll(int peopleAll) {
		this.peopleAll = peopleAll;
	}

	public int getPeopleIn() {
		return peopleIn;
	}

	public void setPeopleIn(int peopleIn) {
		this.peopleIn = peopleIn;
	}

	public int getPeopleOut() {
		return peopleOut;
	}

	public void setPeopleOut(int peopleOut) {
		this.peopleOut = peopleOut;
	}

	@Override
	public String toString() {
		return "PeopleCount [peopleAll=" + peopleAll + ", peopleIn=" + peopleIn + ", peopleOut=" + peopleOut + "]";
	}
	
}
