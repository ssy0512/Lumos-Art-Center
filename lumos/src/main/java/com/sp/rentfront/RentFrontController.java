package com.sp.rentfront;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("rentFront.RentFrontController")
public class RentFrontController {
	
	@RequestMapping(value="/rentfront/main")
	public String main() throws Exception {
		return ".rentfront.main";
	}
	
	
	
	
}
