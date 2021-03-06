package com.sp.admin.sales;

import org.springframework.web.multipart.MultipartFile;

public class AcademySales {
	private int listNum;
	private int academyNum;
	private int totalCount;
	private int price;
	private int roomNum;
	private int instNum;
	private long gap;
	
	private int applyNum;
	private int addCount;		// 수강 신청 인원 

	private String cardNum;
	private String cardCompany;
	private String expiryDate;	// 유효기간 
	private String cvc;
	private String payMonth;
	
	private String mode;
	private String userId;
	private String academyName;
	private String startDate;
	private String endDate;
	
	private String startTime;
	private String endTime;
	
	private String lectureDay;
	private String classInfo;
	private String acProfileImage;
	private String instPhotoImage;
	private String instName;	// 강사이름
	private String profile;
	private String birth;
	private String tel;
	private String roomName;	// 강의실 이름
	private String position;	// 강의실 위치
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile upload; 
	
	private String approveNum;
	private int memberIndex;
	private int total;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
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
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public String getAcademyName() {
		return academyName;
	}
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	public String getclassInfo() {
		return classInfo;
	}
	public void setClassInfo(String classInfo) {
		this.classInfo = classInfo;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getAcProfileImage() {
		return acProfileImage;
	}
	public void setAcProfileImage(String acProfileImage) {
		this.acProfileImage = acProfileImage;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUploads(MultipartFile upload) {
		this.upload = upload;
	}
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public int getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}
	public int getAddCount() {
		return addCount;
	}
	public void setAddCount(int addCount) {
		this.addCount = addCount;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardCompany() {
		return cardCompany;
	}
	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public String getPayMonth() {
		return payMonth;
	}
	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}
	public String getInstPhotoImage() {
		return instPhotoImage;
	}
	public void setInstPhotoImage(String instPhotoImage) {
		this.instPhotoImage = instPhotoImage;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getApproveNum() {
		return approveNum;
	}
	public void setApproveNum(String approveNum) {
		this.approveNum = approveNum;
	}
	public int getMemberIndex() {
		return memberIndex;
	}
	public void setMemberIndex(int memberIndex) {
		this.memberIndex = memberIndex;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
