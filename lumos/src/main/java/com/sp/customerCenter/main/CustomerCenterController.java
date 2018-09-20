package com.sp.customerCenter.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("customerCenter.customerCenterController")
public class CustomerCenterController {

	@RequestMapping("/customerCenter/main")
	public String main() throws Exception {
		return ".customerCenter.main";
	}
}
