package com.solo.PGO.Common.vo;

public class SearchOption {
	private String title;
	private String content;
	private String writer;
	
	public SearchOption() {}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "SearchOption [title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}
	
	
}
