package com.sp.customerCenter.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("customerCenter.customerCenterController")
public class CustomerCenterController {

	@RequestMapping("/customerCenter/main")
	public String main() throws Exception {
		return ".customerCenter.main";
	}
	
	@RequestMapping("/customerCenter/main_notice")
	public String mainToNoticeArticle(
			@RequestParam(value="noticeNum" ) int noticeNum, 
			Model model
			) throws Exception {
		
		model.addAttribute("mNoticeNum", noticeNum);
		model.addAttribute("goTo", "notice");
		return ".customerCenter.main";
	}
}
