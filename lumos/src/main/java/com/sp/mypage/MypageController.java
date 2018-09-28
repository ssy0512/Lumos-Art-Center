package com.sp.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypageController")
public class MypageController {
	@RequestMapping(value="/mypage/main")
	public String main() {
		return ".mypage.mainTest";
	}
}
