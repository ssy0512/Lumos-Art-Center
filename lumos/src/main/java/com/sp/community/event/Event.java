package com.sp.community.event;

import org.springframework.web.multipart.MultipartFile;

public class Event {
	private String title;
	private String eventStart, eventEnd, eventWin;
	private int eventNum;
	private String userId;
	private String content;
	private String originalFilename, saveFilename;
	private String selectOption;
	// 스프링에서 파일 받기
	private MultipartFile upload; 
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getEventWin() {
		return eventWin;
	}
	public void setEventWin(String eventWin) {
		this.eventWin = eventWin;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getSelectOption() {
		return selectOption;
	}
	public void setSelectOption(String selectOption) {
		this.selectOption = selectOption;
	}
	
}
