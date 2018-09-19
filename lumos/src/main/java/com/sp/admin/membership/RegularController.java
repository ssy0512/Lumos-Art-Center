package com.sp.admin.membership;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("admin.membership.regularController")
public class RegularController {
	
	
	
	
	@RequestMapping(value="/admin/membership/regular/regular")
	public String list(Model model) throws Exception {
		model.addAttribute("subMenu", "4");
		return ".admin4.membership.regular.regular";
	}
	
	@RequestMapping(value="/admin/membership/regular/article")
	public String article(Model model) throws Exception {
		model.addAttribute("subMenu", "4");
		return ".admin4.membership.regular.article";
	}
}
