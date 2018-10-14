package com.sp.member;


import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.notice.NoticeService;
import com.sun.media.jai.util.Service;


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
		model.addAttribute("mode","created");

		return".member.find_password";
	}

	// 임시 패스워드 메일 발송 
	@RequestMapping(value="/member/find_password" , method=RequestMethod.POST)
	public String memberFindPassword(
			@RequestParam(value="member_type" , defaultValue="1") int member_type,
			@RequestParam(value="userId" , defaultValue="") String userId,
			@RequestParam(value="email", defaultValue="") String email,
			HttpServletRequest req,
			Model model) throws Exception{

		model.addAttribute("mode","created");

		StringBuffer sb = new StringBuffer();

		// password generate
		Random r=new Random();
		String randomNum=""+r.nextInt(10000);

		if (randomNum.length()!=5){
			int addNum=5-randomNum.length();
			if (addNum>0){
				for (int i=0;i<addNum;i++){
					randomNum="0"+randomNum;
				}
			}
		}

		String randomPassword = "pwd" + randomNum;
		String password = bcryptEncoder.encode(randomPassword);


		int exist = service.updateMemberPassword(userId, email, password, member_type);
		if(exist == 1)
		{
			MemberEmail emailUtil = new MemberEmail();
			emailUtil.mailSend(email, randomPassword);

			sb.append("신규 생성 패스워스가 메일로 전달되었습니다 : " + email);
		}
		else
			sb.append("회원 정보를 찾을 수 없습니다.");

		model.addAttribute("message", sb.toString());

		return".member.member_find_ok"; 
	}

	@RequestMapping(value="/member/member_company" , method=RequestMethod.GET)
	public String memberComapnyForm(Model model) {
		model.addAttribute("mode","created");

		return".member.member_company";

	}

	@RequestMapping(value="/member/join" , method=RequestMethod.GET)
	public String memberJoinForm(Model model) {
		model.addAttribute("mode","created");

		return".member.join";

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
	public String memberCompanySubmit(
			MemberCompany dto
			,Model model
			)
	{

		StringBuffer sb = new StringBuffer();

		try
		{			
			

			String encPwd = bcryptEncoder.encode(dto.mainChargeDTO.getChargePwd());
			dto.setChargePwd(encPwd);

			service.insertMemberCompany(dto);
			
			sb.append(dto.mainChargeDTO.getChargeName()+"님의 회원 가입이 정삭적으로 처리되었습니다.<br>");
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


	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login(String login_error, Model model) throws Exception{
		if(login_error!=null) {
			model.addAttribute("message","아이디 혹은 패스워드가 일치 하지 않습니다.");
		}
		return ".member.login";
	}
	

	@RequestMapping(value="/member/userIdCheck", produces="text/html; charset=utf-8")
	@ResponseBody
	public String checkUserId(
			String login_error
			, Model model
			,@RequestParam(value="type" , defaultValue="0") String type
			,@RequestParam(value="id" , defaultValue="0") String id
			) 
			throws Exception {

	
		int isExist = 0;
		
		if(type.equals("member") == true)
			isExist = service.isMemberUserId(id);
		else
			isExist = service.isCompayChargeId(id);
	
		return isExist + "";
		
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
			MemberCompany dto = service.readMypageCompanyByUserId(userId);
			MemberCompanyCharge chargeDto = service.readMypageCompanyChargeByUserId(userId);
			
			model.addAttribute("companyDTO", dto);
			model.addAttribute("companyChargeDTO", chargeDto);
			
			movePage = ".mypage.member.member_company";
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
		//return ".mainMainLayout";
		return "redirect:/";
	}


	
	@RequestMapping(value="/mypage/member/member_company" , method=RequestMethod.POST)
	public String mypageMemberCompany(
			@RequestParam(value="changepwd" , defaultValue="0") int changepwd
			,MemberCompanyCharge dto
			,Model model
			,HttpSession session) {
		model.addAttribute("mode","created");

		String password = "";

		try
		{
			

			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			dto.setChargeId(userId);

			service.updateMemberCompany(dto);
			
			if(changepwd == 1)
			{
				password = bcryptEncoder.encode(dto.getChargePwd());
				dto.setChargePwd(password);
				
				service.updateMypageMemberCompanyPassword(dto);
			}
			
		}
		catch(Exception e)
		{

		}
		return".mainMainLayout";
	}

	
}
