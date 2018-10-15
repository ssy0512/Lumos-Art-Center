package com.sp.admin.rent;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.AdminUtil;
import com.sp.member.SessionInfo;

@Controller("rental.rentalController")
public class RentalController {
	@Autowired
	private RentalService service;
	@Autowired
	private AdminUtil adminUtil;
	
	@RequestMapping(value="/admin/rent/rental/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="rentNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req, Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchKey);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page=adminUtil.pageCount(rows, dataCount);
		if(total_page<current_page)
			total_page=current_page;
		
		int start=(current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Rental> list=service.listRental(map);
		int listNum , n =0;
		Iterator<Rental> it = list.iterator();
		while(it.hasNext()) {
			Rental data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/admin/rent/rental/list";
		String articleUrl = cp="/admin/rent/rental/article?page="+current_page;
		
		if(searchValue.length()!=0) {
			listUrl = cp+"/admin/rent/rental/list?"+query;
			articleUrl=cp+"/admin/rent/rental/article?page="+current_page;
		}
		String paging=adminUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return ".admin4.rent.rental.list";
	}
	
	@RequestMapping(value="/admin/rent/rental/article")
	public String article(
			@RequestParam(value="rentNum") int rentNum,
			@RequestParam(value="page", defaultValue="1") String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:.member.login";
		}
		
		String query="page="+page;
		
		Rental dto = service.readRental(rentNum);
		if(dto==null)
			return "redirect:admin/rent/rental/list?"+query;
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return ".admin4.rent.rental.article";
	}
}
