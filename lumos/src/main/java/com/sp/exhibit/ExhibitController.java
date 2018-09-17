package com.sp.exhibit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("exhibit.exhibitController")
public class ExhibitController {
	
	@RequestMapping(value="exhibit/main")
	public String main() {
		return ".exhibit.main";
	}
}
