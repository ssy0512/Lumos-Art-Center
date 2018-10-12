package com.sp.concert;

public class ConReview {
	private int creviewNum;
	private String userId;
	private String subject;
	private String content;
	private String created;
	private int hitCount;
	private int concertNum;
	private int score;
	
	public int getCreviewNum() {
		return creviewNum;
	}
	public void setCreviewNum(int creviewNum) {
		this.creviewNum = creviewNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getConcertNum() {
		return concertNum;
	}
	public void setConcertNum(int concertNum) {
		this.concertNum = concertNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
