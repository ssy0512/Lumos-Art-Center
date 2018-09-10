package com.sp.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member.memberController")
public class MemberController {
	
	/*@Autowired
	private BCryptPasswordEncoder bcryptEncoder;*/
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String login(String login_error, Model model) throws Exception{
		if(login_error!=null) {
			model.addAttribute("message","아이디 혹은 패스워드가 일치 하지 않습니다.");
		}
		return ".member.login";
	}
	
		
		
}
