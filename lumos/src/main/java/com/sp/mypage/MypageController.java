package com.sp.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("mypage.mypageController")
public class MypageController {
	@Autowired
	private MypageService service;
	
	@RequestMapping(value="/mypage/main")
	public String main() {
		return ".mypage.myActivity.main";
	}
	
	@RequestMapping(value="/mypage/myInformation")
	@ResponseBody
	public Map<String, Object> getMyInfo(
			HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String created=service.getCreatedDate(info.getUserId());
		int usableMile=service.getUsableMileage(info.getUserId());
		
		Map<String, Object> model = new HashMap<>();
		model.put("created", created);
		model.put("mile", usableMile);
		
		return model;
	}

}
