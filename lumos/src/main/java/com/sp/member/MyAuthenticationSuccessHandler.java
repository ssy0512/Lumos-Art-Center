package com.sp.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	@Autowired
	private MemberService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Member memberDTO = null;
		MemberCompanyCharge memberCompnayChargeDTO = null;
		
		HttpSession session=request.getSession();
		SessionInfo info=new SessionInfo();
		
		String userId=authentication.getName();
		info.setUserId(userId);
		
		int isMember = service.isMember(userId);
		
		if(isMember == 1) // 개인
		{
			service.updateLastLoginDate(userId);
			memberDTO=service.readMember(userId);
			info.setUserName(memberDTO.getUserName());
			
		}
		else // 기업
		{
			service.updateCompnayLastLoginDate(userId);
			memberCompnayChargeDTO=service.readCompanyMember(userId);
			info.setUserName(memberCompnayChargeDTO.getChargeName());
		}
		
		session.setAttribute("member", info); //세션의 정보 저장
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
