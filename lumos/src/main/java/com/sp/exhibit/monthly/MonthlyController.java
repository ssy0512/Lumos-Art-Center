package com.sp.exhibit.monthly;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("monthly.monthlyController")
public class MonthlyController {

	@RequestMapping(value="exhibit/monthly/list")
	public String main() {
		return "/exhibit/monthly/list";
	}
}
