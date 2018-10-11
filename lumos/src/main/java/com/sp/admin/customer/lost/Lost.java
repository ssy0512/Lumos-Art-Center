package com.sp.admin.customer.lost;


public class Lost {
	
	private int listNum;
	private int lostNum ; // 분실물번호
	private String lostPerson; // 이름 
	private String lostName; // 분실명
	private String tel; // 전화 
	private String email; // 이메일 (전송용)
	private String lostDate; // 분실일자 	
	private String lostPlace; //분실장소 
	private String content ; // 내용
	private int lostStatus ; // 상태 (관리자) 
	private String lostStatusName ; // 상태 (관리자) 
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getLostNum() {
		return lostNum;
	}
	public void setLostNum(int lostNum) {
		this.lostNum = lostNum;
	}
	public String getLostPerson() {
		return lostPerson;
	}
	public void setLostPerson(String lostPerson) {
		this.lostPerson = lostPerson;
	}
	public String getLostName() {
		return lostName;
	}
	public void setLostName(String lostName) {
		this.lostName = lostName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLostDate() {
		return lostDate;
	}
	public void setLostDate(String lostDate) {
		this.lostDate = lostDate;
	}
	public String getLostPlace() {
		return lostPlace;
	}
	public void setLostPlace(String lostPlace) {
		this.lostPlace = lostPlace;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLostStatus() {
		return lostStatus;
	}
	public void setLostStatus(int lostStatus) {
		this.lostStatus = lostStatus;
	}
	public String getLostStatusName() {
		return lostStatusName;
	}
	public void setLostStatusName(String lostStatusName) {
		this.lostStatusName = lostStatusName;
	}
	
}
