package com.sp.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	public int isMember(String userId);
	
	public Member readMember(String userId);
	public Member readMypageMember(String userId);
	
	public MemberCompany readMypageCompanyByUserId(String userId);
	public MemberCompanyCharge readMypageCompanyChargeByUserId(String userId);
	
	public MemberCompanyCharge readCompanyMember(String userId);

	public String readMemberId(String userName, String email, int memberType);
	
	public void insertMember(Member dto) throws Exception ;
	public void insertMemberCompany(MemberCompany dto) throws Exception ;
	
	public void updateMember(Member dto) throws Exception;
	public void updateMemberCompany(MemberCompanyCharge dto) throws Exception;
	
	public int updateLastLoginDate(String userId);
	public int updateCompnayLastLoginDate(String userId);
	
	public int updateMemberPassword(String userId, String email, String userPwd, int memberType);
	public void updateMypageMemberPassword(Member dto) throws Exception ;
	
	public void updateMypageMemberCompanyPassword(MemberCompanyCharge dto) throws Exception ;
	
	
	public int deleteMember(String userId);
	
	public int insertAuthority(Member dto);
	public int updateAuthority(Member dto);
	public List<Member> listAuthority(String userId);

	

}
