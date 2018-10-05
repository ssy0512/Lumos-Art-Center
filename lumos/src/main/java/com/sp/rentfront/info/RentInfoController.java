package com.sp.rentfront.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("rentnotice.InfoController")
public class RentInfoController {

	@RequestMapping(value="/rentfront/info/list")
	public String main(
			Model model) throws Exception {
		
		
		return "rentfront/info/list";
	}
	
}
