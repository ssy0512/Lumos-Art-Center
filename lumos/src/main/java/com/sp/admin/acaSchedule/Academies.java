package com.sp.admin.acaSchedule;

import org.springframework.web.multipart.MultipartFile;

public class Academies {
	private int listNum;
	private int academyNum;
	private String academyName;
	private int totalCount;
	private String startDate;
	private String EndDate;
	private String startTime;
	private String endTime;
	private String lectureDay;
	private int price;
	private int roomNum; //roominfo 
	private String roomName;
	private int instNum;
	private String instName;
	private String acProfileImage;
	private MultipartFile upload;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getAcademyNum() {
		return academyNum;
	}
	public void setAcademyNum(int academyNum) {
		this.academyNum = academyNum;
	}
	public String getAcademyName() {
		return academyName;
	}
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return EndDate;
	}
	public void setEndDate(String endDate) {
		EndDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getLectureDay() {
		return lectureDay;
	}
	public void setLectureDay(String lectureDay) {
		this.lectureDay = lectureDay;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
	}
	public String getAcProfileImage() {
		return acProfileImage;
	}
	public void setAcProfileImage(String acProfileImage) {
		this.acProfileImage = acProfileImage;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
	
}
	