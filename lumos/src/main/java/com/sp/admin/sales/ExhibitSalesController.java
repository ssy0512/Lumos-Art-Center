package com.sp.admin.sales;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("admin.sales.exhibitSalesController")
public class ExhibitSalesController {
	@Autowired
	private ExhibitSalesService service;
	@Autowired
	private MyUtil myUtil;
	
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="companyIndex") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
	
		return ".admin4.sales.exhibit.salesList";
	}
	
}
