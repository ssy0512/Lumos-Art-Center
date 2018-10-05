package com.sp.ticketing;

public class Ticketing {
	private String sessionDate;
	private int concertNum,sessionNum;
	private String sessionTime;
	private String seatLevel;
	private int seatCount;
	private String color;
	private int hallNum;
	
	public String getSessionDate() {
		return sessionDate;
	}

	public void setSessionDate(String sessionDate) {
		this.sessionDate = sessionDate;
	}

	public int getConcertNum() {
		return concertNum;
	}
	
	public void setConcertNum(int concertNum) {
		this.concertNum = concertNum;
	}
	
	public int getSessionNum() {
		return sessionNum;
	}

	public void setSessionNum(int sessionNum) {
		this.sessionNum = sessionNum;
	}

	public String getSessionTime() {
		return sessionTime;
	}

	public void setSessionTime(String sessionTime) {
		this.sessionTime = sessionTime;
	}

	public String getSeatLevel() {
		return seatLevel;
	}

	public void setSeatLevel(String seatLevel) {
		this.seatLevel = seatLevel;
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getHallNum() {
		return hallNum;
	}

	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
}
