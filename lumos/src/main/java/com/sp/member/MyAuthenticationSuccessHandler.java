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
		
		String userId=authentication.getName();
		service.updateLastLoginDate(userId);
		
		HttpSession session=request.getSession();
		Member dto=service.readMember(userId);
		SessionInfo info=new SessionInfo();
		info.setUserId(userId);
		info.setUserName(dto.getUserName());
		
		session.setAttribute("member", info); //세션의 정보 저장
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
