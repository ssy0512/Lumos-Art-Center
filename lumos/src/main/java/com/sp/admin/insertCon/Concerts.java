package com.sp.admin.insertCon;

import org.springframework.web.multipart.MultipartFile;

public class Concerts {
	private int listNum;
	private MultipartFile upload;
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	private int hallNum;
	private String hallName;
	private int totalSeat;
	private int ratingNum;
	private String ratingName;
	private int eventCount;
	private String conProfileImage;
	private int seatLevelNum,seatLevel,seatPrice;
	private String concertNum;
	private String concertName;
	private String concertStart;
	private String concertEnd;
	private String content;
	private String totalTime;
	private String host;
	private String supervise;
	private int sessionNum;
	private String sessionDate;
	private String genre;
	private String seatlevel;
	private int seatprice;
	private int seatlevelnum;
	
	public String getSeatlevel() {
		return seatlevel;
	}
	public void setSeatlevel(String seatlevel) {
		this.seatlevel = seatlevel;
	}
	public int getSeatprice() {
		return seatprice;
	}
	public void setSeatprice(int seatprice) {
		this.seatprice = seatprice;
	}
	public int getSeatlevelnum() {
		return seatlevelnum;
	}
	public void setSeatlevelnum(int seatlevelnum) {
		this.seatlevelnum = seatlevelnum;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getSessionNum() {
		return sessionNum;
	}
	public void setSessionNum(int sessionNum) {
		this.sessionNum = sessionNum;
	}
	public String getSessionDate() {
		return sessionDate;
	}
	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
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
	public int getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
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
	public int getEventCount() {
		return eventCount;
	}
	public void setEventCount(int eventCount) {
		this.eventCount = eventCount;
	}
	public String getConProfileImage() {
		return conProfileImage;
	}
	public void setConProfileImage(String conProfileImage) {
		this.conProfileImage = conProfileImage;
	}
	public int getSeatLevelNum() {
		return seatLevelNum;
	}
	public void setSeatLevelNum(int seatLevelNum) {
		this.seatLevelNum = seatLevelNum;
	}
	public int getSeatLevel() {
		return seatLevel;
	}
	public void setSeatLevel(int seatLevel) {
		this.seatLevel = seatLevel;
	}
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	public String getConcertNum() {
		return concertNum;
	}
	public void setConcertNum(String concertNum) {
		this.concertNum = concertNum;
	}
	public String getConcertName() {
		return concertName;
	}
	public void setConcertName(String concertName) {
		this.concertName = concertName;
	}
	public String getConcertStart() {
		return concertStart;
	}
	public void setConcertStart(String concertStart) {
		this.concertStart = concertStart;
	}
	public String getConcertEnd() {
		return concertEnd;
	}
	public void setConcertEnd(String concertEnd) {
		this.concertEnd = concertEnd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
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
	
	
	
}
	