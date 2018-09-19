package com.sp.admin.exh;

public class ExhibitSch {
	private int locationNum;
	private String kind;
	
	private int hallNum;
	private String hallName;
	private String exHallLocate;
	private String color;
	private int exhibitNum;
	private String exhibitName;
	private String exhibitStart;//날짜
	private String exhibitEnd;
	private String host;
	private String supervise;
	private String content;
	private String admitStart;
	private String admitEnd;
	private String genre; //genreName 이미 디비에 들어있다. 어떻게 가지고 와야 하나요
	private int ratingNum;
	private String ratingName;
	
	public int getLocationNum() {
		return locationNum;
	}
	public void setLocationNum(int locationNum) {
		this.locationNum = locationNum;
	}
	public String kind() {
		return kind;
	}
	public void setkind(String kind) {
		this.kind = kind;
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
	public String getExHallLocate() {
		return exHallLocate;
	}
	public void setExHallLocate(String exHallLocate) {
		this.exHallLocate = exHallLocate;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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
	public void setAdmitStart(String admintStart) {
		this.admitStart = admintStart;
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
	
}
