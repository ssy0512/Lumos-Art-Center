package com.sp.sch;

public class Schedule {
	private int concertNum;
	private String concertStart, concertEnd;
	private String concertName, hallName;
	private String subject, memo, color;
	private String sday, eday, stime, etime, period;
	private String allDay;
	private int repeat, repeat_cycle;
	private String created;
	
	public int getConcertNum() {
		return concertNum;
	}
	public void setConcertNum(int concertNum) {
		this.concertNum = concertNum;
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
	public String getConcertName() {
		return concertName;
	}
	public void setConcertName(String concertName) {
		this.concertName = concertName;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public int getRepeat_cycle() {
		return repeat_cycle;
	}
	public void setRepeat_cycle(int repeat_cycle) {
		this.repeat_cycle = repeat_cycle;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
}
