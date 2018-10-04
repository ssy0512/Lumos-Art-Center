package com.sp.admin.staff;

import org.springframework.web.multipart.MultipartFile;

public class Staff {
	private int staffNum;
	private int listNum;
	
	private String staffName;
	private String birth;
	private String department;
	private String tel;
	private String staffImage;
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getStaffNum() {
		return staffNum;
	}
	public void setStaffNum(int staffNum) {
		this.staffNum = staffNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStaffImage() {
		return staffImage;
	}
	public void setStaffImage(String staffImage) {
		this.staffImage = staffImage;
	}
	
	
}