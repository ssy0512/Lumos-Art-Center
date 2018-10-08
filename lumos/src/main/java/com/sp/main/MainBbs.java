package com.sp.main;

public class MainBbs {
	private int important;
	private int noticeNum;
	
	private int eventNum;
	private String selectOption;
	private String eventStart;
	private String eventEnd;
	
	private String title;
	private String created;
	
	public int getImportant() {
		return important;
	}
	public void setImportant(int important) {
		this.important = important;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getSelectOption() {
		return selectOption;
	}
	public void setSelectOption(String selectOption) {
		this.selectOption = selectOption;
	}
	public String getEventStart() {
		return eventStart;
	}
	public void setEventStart(String eventStart) {
		this.eventStart = eventStart;
	}
	public String getEventEnd() {
		return eventEnd;
	}
	public void setEventEnd(String eventEnd) {
		this.eventEnd = eventEnd;
	}
}
