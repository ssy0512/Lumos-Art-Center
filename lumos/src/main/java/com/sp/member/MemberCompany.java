package com.sp.member;

public class MemberCompany {
	
	private long companyIndex;
	private String companyName;
	private String repName;
	private String repNumber;
	private String fax;
	private String businessNumber;
	private String businessPost;
	private String address1;
	private String address2;
	private String authority;
	
	public MemberCompanyCharge mainChargeDTO = new MemberCompanyCharge();
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public long getCompanyIndex() {
		return companyIndex;
	}
	public void setCompanyIndex(long companyIndex) {
		this.companyIndex = companyIndex;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRepName() {
		return repName;
	}
	public void setRepName(String repName) {
		this.repName = repName;
	}
	public String getRepNumber() {
		return repNumber;
	}
	public void setRepNumber(String repNumber) {
		this.repNumber = repNumber;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getBusinessPost() {
		return businessPost;
	}
	public void setBusinessPost(String businessPost) {
		this.businessPost = businessPost;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress2() {
		return address2;
	}
	
	/************************/
	
	public void setChargeId(String chargeId) {
		this.mainChargeDTO.setChargeId(chargeId);
	}
	public void setChargeName(String chargeName) {
		this.mainChargeDTO.setChargeName(chargeName);
	}
	public void setChargePwd(String chargePwd) {
		this.mainChargeDTO.setChargePwd(chargePwd);
	}
	public void setChargeTel(String chargeTel) {
		this.mainChargeDTO.setChargeTel(chargeTel);
	}
	public void setChargeEmail(String chargeEmail) {
		this.mainChargeDTO.setChargeEmail(chargeEmail);
	}
	
}
