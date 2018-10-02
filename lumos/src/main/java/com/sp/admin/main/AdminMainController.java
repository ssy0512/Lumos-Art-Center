package com.sp.admin.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.member.SessionInfo;

@Controller("adminMainController")
public class AdminMainController {
	 
	@RequestMapping(value="admin/main", method=RequestMethod.GET)
	public String method(HttpSession session) {
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return ".member.login";
		}else if(! info.getUserId().equals("admin")) {
			return ".member.noAuthorized";
		}
		return ".admin4Layout";
	}
}
