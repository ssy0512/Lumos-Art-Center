package com.sp.goods.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("goods.mainController")
public class MainController {
	 
	@RequestMapping(value="/goods", method=RequestMethod.GET)
	public String method() {
		return ".goodsLayout";
	}
}
