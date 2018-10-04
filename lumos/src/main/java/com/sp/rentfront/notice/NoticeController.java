package com.sp.rentfront.notice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("notice.NoticeController")
public class NoticeController {

	@RequestMapping(value="rentfront/notice/list")
	public String main() {
		return "/rentfront/notice/list";
	}
}
