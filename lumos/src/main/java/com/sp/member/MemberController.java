package com.sp.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller("member.memberController")
public class MemberController {

	/*@Autowired
	private BCryptPasswordEncoder bcryptEncoder;*/

	@Autowired
	private MemberService service; 
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;


	@RequestMapping(value="/member/member" , method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode","created");

		return".member.member";

	}

	@RequestMapping(value="/member/member_ok" , method=RequestMethod.GET)
	public String memberOkForm(Model model) {
		model.addAttribute("mode","created");

		return".member.member_ok";

	}

	@RequestMapping(value="/member/find_id" , method=RequestMethod.GET)
	public String memberFindIdForm(Model model) {
		model.addAttribute("mode","created");

		return".member.find_id";
	}

	@RequestMapping(value="/member/find_id" , method=RequestMethod.POST)
	public String memberFind(
			@RequestParam(value="member_type" , defaultValue="1") int member_type,
			@RequestParam(value="userName" , defaultValue="") String userName,
			@RequestParam(value="email", defaultValue="") String email,
			HttpServletRequest req,
			Model model) throws Exception{

		model.addAttribute("mode","created");

		String findId = service.readMemberId(userName, email, member_type);

		StringBuffer sb = new StringBuffer();

		try
		{
			if(findId != null && findId.equals("") == false)
			{
				String resultId = "";

				for(int i=0; i < findId.length(); i++)
				{
					if(i < 3)
						resultId += findId.charAt(i);
					else
						resultId += "*";
				}

				sb.append("아이디 검색 결과 : " + resultId);
			}
			else
				sb.append("아이디를 찾을 수 없습니다.");
		}
		catch(Exception e)
		{

		}

		model.addAttribute("message", sb.toString());
		model.addAttribute("title", "회원 가입");

		return ".member.member_find_ok"; 
	}

	@RequestMapping(value="/member/find_password" , method=RequestMethod.GET)
	public String memberFindPasswordForm(Model model) {
		
		return null;
	}

	
	@RequestMapping(value="/member/find_password" , method=RequestMethod.POST)
	public String memberFindPassword() throws Exception{

		
		return null; 
	}

	@RequestMapping(value="/member/member_company" , method=RequestMethod.GET)
	public String memberComapnyForm() {

		return null;

	}

	@RequestMapping(value="/member/join" , method=RequestMethod.GET)
	public String memberJoinForm(Model model) {
		model.addAttribute("mode","created");

		return ".member.join";

	}

	@RequestMapping(value="/member/member" , method=RequestMethod.POST)
	public String memberSubmit(
			Member dto
			,Model model
			)
	{

		StringBuffer sb = new StringBuffer();

		try
		{
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);

			service.insertMember(dto);
			
			sb.append(dto.getUserName()+"님의 회원 가입이 정삭적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");

		}
		catch(Exception e)
		{
			sb.append("회원가입이 실패했습니다. 관리자에게 문의하세요.<br/>");
		}

		model.addAttribute("message", sb.toString());
		model.addAttribute("title", "회원 가입");

		return ".member.member_ok"; 
	}


	@RequestMapping(value="/member/member_company" , method=RequestMethod.POST)
	public String memberCompanySubmit()
	{

		return null; 
	}


	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login(String login_error, Model model) throws Exception{
		if(login_error!=null) {
			model.addAttribute("message","아이디 혹은 패스워드가 일치 하지 않습니다.");
		}
		return ".member.login";
	}

	@RequestMapping(value="/mypage/member/member" , method=RequestMethod.GET)
	public String mypageMemberForm(
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		String movePage = "";
		
		if(service.isMember(userId) == 1)
		{
			Member dto = service.readMypageMember(userId);
			model.addAttribute("memberDTO", dto);
			movePage = ".mypage.member.member";
		}
		else
		{
		

		}
		
		return movePage;
	}

	@RequestMapping(value="/mypage/member/member" , method=RequestMethod.POST)
	public String mypageMember(
			@RequestParam(value="changepwd" , defaultValue="0") int changepwd
			,Member dto
			,Model model
			,HttpSession session) {
		model.addAttribute("mode","created");

		String password = "";

		try
		{
			

			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			dto.setUserId(userId);

			service.updateMember(dto);
			
			if(changepwd == 1)
			{
				password = bcryptEncoder.encode(dto.getUserPwd());
				dto.setUserPwd(password);
				
				service.updateMypageMemberPassword(dto);
			}
			
		}
		catch(Exception e)
		{

		}
		return".mainMainLayout";
	}


	
	@RequestMapping(value="" , method=RequestMethod.POST)
	public String mypageMemberCompany() {
		
		return null;
	}

		
	
	
}
