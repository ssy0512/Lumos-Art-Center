package com.sp.exhibit.annual;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("annual.annualController")
public class AnnualController {

	@RequestMapping(value="exhibit/annual/list")
	public String main() {
		return "/exhibit/annual/list";
	}
}
