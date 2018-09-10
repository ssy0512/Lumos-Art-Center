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
	public void insertMember(Member dto) throws Exception {
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
	public int updateLastLoginDate(String userId) {
		int result=0;
		try {
			result=dao.updateData("member.updateLastLoginDate", userId);
		} catch (Exception e) {
		}
		return result;
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
}
