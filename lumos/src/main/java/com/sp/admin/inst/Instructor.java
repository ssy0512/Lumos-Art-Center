package com.sp.admin.inst;

import org.springframework.web.multipart.MultipartFile;

public class Instructor {
	public int instNum;
	public int listNum;
	public String instName;
	public String birth;
	public String tel;
	public String instPhotoImage;
	public String profile;
	public MultipartFile upload;
	public int getInstNum() {
		return instNum;
	}
	public void setInstNum(int instNum) {
		this.instNum = instNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
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
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
}
