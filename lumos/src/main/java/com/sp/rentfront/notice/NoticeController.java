package com.sp.rentfront.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("rentnotice.NoticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/rentfront/notice/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows=20;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> clist=service.listHall(map);
		List<Notice> elist=service.listExHall(map);
		
		String paging=myUtil.paging(current_page, total_page);
		
		model.addAttribute("clist", clist);
		model.addAttribute("elist", elist);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		
		return "rentfront/notice/list";
	}
	
	@RequestMapping(value="/rentfront/notice/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		
		return "rentfront/notice/created";
	}
}
