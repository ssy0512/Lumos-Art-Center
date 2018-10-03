package com.sp.admin.staff;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("staff.staffController")
public class StaffController {
	@Autowired
	private StaffService service;
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/admin/staff/stafflist")
	public String listStaff(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="staffNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		
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
			total_page=util.pageCount(rows, dataCount);
		if(total_page<current_page)
			total_page=current_page;
		
		int start=(current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Staff> list=service.listStaff(map);
		int listNum , n =0;
		Iterator<Staff> it = list.iterator();
		while(it.hasNext()) {
			Staff data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/admin/staff/stafflist";
		String articleUrl = cp="/admin/staff/article?page="+current_page;
		
		if(searchValue.length()!=0) {
			listUrl = cp+"/admin/staff/stafflist?"+query;
			articleUrl=cp+"/admin/staff/article?page="+current_page;
		}
		String paging=util.paging(current_page, total_page,listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return ".admin4.staff.stafflist";
	}
	
	@RequestMapping(value="/admin/staff/artice")
	public String article (@RequestParam(value="staffNum") int staffNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="staffName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue= URLDecoder.decode(searchValue, "utf-8");
		String query="page="+page;
		if(searchValue.length()!=0) {
			query="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Staff dto = service.readStaff(staffNum);
		if(dto==null)
			return "redirect:admin/staff/stafflist?"+query;
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		return ".admin4.staff.article";
		
	}
	
	
}
