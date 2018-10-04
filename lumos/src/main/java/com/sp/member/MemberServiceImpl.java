package com.sp.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	
	@Override
	public int updateMemberPassword(String userId, String email, String userPwd, int memberType) {
		// TODO Auto-generated method stub
		
		Member dto = new Member();
		MemberCompanyCharge companyDto = new MemberCompanyCharge();
		
		int isExist = 0;
		
		try {
			
			if(memberType == 1) // 개인
			{
				dto.setUserId(userId);
				dto.setEmail(email);
				dto.setUserPwd(userPwd);
				
				isExist = dao.selectOne("member.isMemberForPassword", dto);
				if(isExist != 0)
					dao.updateData("member.updateMemeberPassword", dto);
			}
			else // 기업
			{
				companyDto.setChargeId(userId);
				companyDto.setChargeEmail(email);
				companyDto.setChargePwd(userPwd);
				
				isExist = dao.selectOne("member.isMemberCompanyForPassword", companyDto);
				if(isExist != 0)
					dao.updateData("member.updateMemeberCompanyPassword", companyDto);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isExist;
		
	}

	
	
	@Override
	public String readMemberId(String userName, String email, int memberType) {
		
		Member dto = new Member();
		MemberCompanyCharge companyDto = new MemberCompanyCharge();
		
		String findId = "";
		
		try {
			
			if(memberType == 1) // 개인
			{
				dto.setUserName(userName);
				dto.setEmail(email);
				
				dto = dao.selectOne("member.findMemberId", dto);
				findId = dto.getUserId();
			}
			else // 기업
			{
				companyDto.setChargeName(userName);
				companyDto.setChargeEmail(email);
				
				companyDto = dao.selectOne("member.findMemberCompanyId", companyDto);
				findId = companyDto.getChargeId();
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return findId;
	}
	
	@Override
	public Member readMember(String userId) {
		Member dto=null;
		try {
			dto=dao.selectOne("member.readMember", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}


	@Override
	public MemberCompany readMypageCompanyByUserId(String userId) {
		MemberCompany dto=null;
		try {
			dto=dao.selectOne("member.readMypageCompanyByUserId", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	
	@Override
	public MemberCompanyCharge readMypageCompanyChargeByUserId(String userId) {
		MemberCompanyCharge dto=null;
		try {
			dto=dao.selectOne("member.readMypageCompanyChargeByUserId", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	

	@Override
	public Member readMypageMember(String userId) {
		Member dto=null;
		try {
			dto=dao.selectOne("member.readMypageMember", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	
	@Override
	public MemberCompanyCharge readCompanyMember(String userId) {
		
		MemberCompanyCharge dto=null;
		try {
			dto=dao.selectOne("member.readCompanyMember", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public void insertMember(Member dto) throws Exception {
		
		/*
		try {
			
			// 회원정보 저장
			dao.insertData("member.insertMember", dto);
			
			// 권한저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
		*/
		
		try {
			
			int memberSeq = dao.selectOne("member.readMemberSeq");
			dto.setMemberIndex(memberSeq);
			
			// 회원정보 저장
			dao.insertData("member.insertMember", dto);
			
			// 권한저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);
			
		} catch (Exception e) {
			throw e;
		}
	}
	
	
	@Override
	public void insertMemberCompany(MemberCompany dto) throws Exception {
		// TODO Auto-generated method stub
try {
	
			MemberCompanyCharge chargeDTO = null;
	
			chargeDTO = dto.mainChargeDTO;
			
			int memberSeq = dao.selectOne("member.readMemberCompanySeq");
			dto.setCompanyIndex(memberSeq);
			chargeDTO.setCompanyIndex(memberSeq);
			
			// 기업정보
			dao.insertData("member.insertMemberCompany", dto);
			dao.insertData("member.insertMemberCompanyCharge", chargeDTO);
			
			// 권한저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertCompanyAuthority", chargeDTO);
			
			
			
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	
	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			
			dao.updateData("member.updateMember", dto);
			
		} catch (Exception e) {
			throw e;
		}
	}


	@Override
	public void updateMemberCompany(MemberCompanyCharge dto) throws Exception {
		try {
			
			dao.updateData("member.updateMemberCompany", dto);
			
		} catch (Exception e) {
			throw e;
		}
		
	}
	

	@Override
	public void updateMypageMemberPassword(Member dto) throws Exception{
		// TODO Auto-generated method stub
		try {

			dao.updateData("member.updateMypageMemberPassword", dto);

		} catch (Exception e) {
			throw e;
		}
	}
	

	@Override
	public void updateMypageMemberCompanyPassword(MemberCompanyCharge dto) throws Exception {
		// TODO Auto-generated method stub
		try {

			dao.updateData("member.updateMypageMemberCompanyPassword", dto);

		} catch (Exception e) {
			throw e;
		}

	}



	
	@Override
	public int updateLastLoginDate(String userId) {
		int result=0;
		try {
			result=dao.updateData("member.updateLastLoginDate", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateCompnayLastLoginDate(String userId) {
	
		return 0;
	
	}
	
	@Override
	public int deleteMember(String userId) {
		int result=0;
		try {
			result=dao.deleteData("member.deleteMember", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int insertAuthority(Member member) {
		int result=0;
		try {
			result=dao.insertData("member.insertAuthority", member);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateAuthority(Member dto) {
		int result=0;
		try {
			result=dao.updateData("member.updateAuthority", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		List<Member> list=null;
		try {
			list=dao.selectList("member.listAuthority", userId);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int isMember(String userId) {

		int isMember = 0;
		
		try {
			isMember = dao.selectOne("member.isMember", userId);
		} catch (Exception e) {
		}

		return isMember;
	}

}
