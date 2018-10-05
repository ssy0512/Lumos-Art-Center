package com.sp.ticketing;

public class Ticketing {
	private String sessionDate;
	private int concertNum,sessionNum;
	private String sessionTime;
	
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
}
