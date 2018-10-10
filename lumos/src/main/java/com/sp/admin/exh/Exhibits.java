package com.sp.admin.exh;

import org.springframework.web.multipart.MultipartFile;

public class Exhibits {
	private int listNum;
	private int exhibitNum;
	private String exhibitName;
	private String exhibitStart;
	private String exhibitEnd;
	private String host;
	private String supervise;
	private String content;
	private String admitStart;
	private String admitEnd;
	private String genre;
	private int ratingNum;
	private String ratingName;
	private int hallNum;
	private  String hallName;
	private String exProfileImage;
	private MultipartFile upload;
	private String expriceString;
	private int audiencelevelNum;
	private String audience;
	private int exprice;
	
	
	public int getAudiencelevelNum() {
		return audiencelevelNum;
	}
	public void setAudiencelevelNum(int audiencelevelNum) {
		this.audiencelevelNum = audiencelevelNum;
	}
	public String getAudience() {
		return audience;
	}
	public void setAudience(String audience) {
		this.audience = audience;
	}
	public int getExprice() {
		return exprice;
	}
	public void setExprice(int exprice) {
		this.exprice = exprice;
	}
	public String getExpriceString() {
		return expriceString;
	}
	public void setExpriceString(String expriceString) {
		this.expriceString = expriceString;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getExhibitNum() {
		return exhibitNum;
	}
	public void setExhibitNum(int exhibitNum) {
		this.exhibitNum = exhibitNum;
	}
	public String getExhibitName() {
		return exhibitName;
	}
	public void setExhibitName(String exhibitName) {
		this.exhibitName = exhibitName;
	}
	public String getExhibitStart() {
		return exhibitStart;
	}
	public void setExhibitStart(String exhibitStart) {
		this.exhibitStart = exhibitStart;
	}
	public String getExhibitEnd() {
		return exhibitEnd;
	}
	public void setExhibitEnd(String exhibitEnd) {
		this.exhibitEnd = exhibitEnd;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getSupervise() {
		return supervise;
	}
	public void setSupervise(String supervise) {
		this.supervise = supervise;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAdmitStart() {
		return admitStart;
	}
	public void setAdmitStart(String admitStart) {
		this.admitStart = admitStart;
	}
	public String getAdmitEnd() {
		return admitEnd;
	}
	public void setAdmitEnd(String admitEnd) {
		this.admitEnd = admitEnd;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getRatingNum() {
		return ratingNum;
	}
	public void setRatingNum(int ratingNum) {
		this.ratingNum = ratingNum;
	}
	public String getRatingName() {
		return ratingName;
	}
	public void setRatingName(String ratingName) {
		this.ratingName = ratingName;
	}
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getExProfileImage() {
		return exProfileImage;
	}
	public void setExProfileImage(String exProfileImage) {
		this.exProfileImage = exProfileImage;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
}
	