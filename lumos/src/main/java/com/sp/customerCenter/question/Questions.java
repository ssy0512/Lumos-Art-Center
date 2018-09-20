package com.sp.customerCenter.question;

public class Questions {
	public int postNum;
	public int listNum;
	
	public long memberIndex;
	public String userId, userName;
	public String title;
	public String content;
	public int groupNum;
	public int depth;
	public int parent;
	public int orderNo;

	public int qCategoryCode;
	public String qCategoryName;
	
	public String created;

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public long getMemberIndex() {
		return memberIndex;
	}

	public void setMemberIndex(long memberIndex) {
		this.memberIndex = memberIndex;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNum() {
		return groupNum;
	}

	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrderNo() {
		return orderNo;
	}
	
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getqCategoryCode() {
		return qCategoryCode;
	}

	public void setqCategoryCode(int qCategoryCode) {
		this.qCategoryCode = qCategoryCode;
	}

	public String getqCategoryName() {
		return qCategoryName;
	}

	public void setqCategoryName(String qCategoryName) {
		this.qCategoryName = qCategoryName;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}
	
}
