package com.sp.exhibit;

public class ExReview {
	private int exreviewNum;
	private String userId;
	private String subject;
	private String content;
	private String created;
	private int hitCount;
	private int exhibitNum;
	private int score;
	
	public int getExreviewNum() {
		return exreviewNum;
	}
	public void setExreviewNum(int exreviewNum) {
		this.exreviewNum = exreviewNum;
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
	public int getExhibitNum() {
		return exhibitNum;
	}
	public void setExhibitNum(int exhibitNum) {
		this.exhibitNum = exhibitNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
