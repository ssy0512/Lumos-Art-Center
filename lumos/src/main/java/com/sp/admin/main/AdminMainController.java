package com.sp.admin.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adminMainController")
public class AdminMainController {
	 
	@RequestMapping(value="admin/main", method=RequestMethod.GET)
	public String method() {
		return ".admin4Layout";
	}
}
