package com.sp.member;

public class MemberCompanyCharge {
	
	private long companyIndex;
	private String chargeId;
	private String chargeName;
	private String chargePwd;
	private String chargeTel;
	private String chargeEmail;
	private String enabled;
	private String createdDate;
	private String modifyDate;
	
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	private String lastLoginDate;
	
	
	
	public long getCompanyIndex() {
		return companyIndex;
	}
	public void setCompanyIndex(long companyIndex) {
		this.companyIndex = companyIndex;
	}
	public String getChargeId() {
		return chargeId;
	}
	public void setChargeId(String chargeId) {
		this.chargeId = chargeId;
	}
	public String getChargeName() {
		return chargeName;
	}
	public void setChargeName(String chargeName) {
		this.chargeName = chargeName;
	}
	public String getChargePwd() {
		return chargePwd;
	}
	public void setChargePwd(String chargePwd) {
		this.chargePwd = chargePwd;
	}
	public String getChargeTel() {
		return chargeTel;
	}
	public void setChargeTel(String chargeTel) {
		this.chargeTel = chargeTel;
	}
	public String getChargeEmail() {
		return chargeEmail;
	}
	public void setChargeEmail(String chargeEmail) {
		this.chargeEmail = chargeEmail;
	}

}
