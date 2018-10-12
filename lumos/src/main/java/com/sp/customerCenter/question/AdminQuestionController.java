package com.sp.customerCenter.question;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.common.AdminUtil;

@Controller("customerCenter.adminQuestionController")
public class AdminQuestionController {
//관리자단에서 보이는 리스트. 제목을 누르면 해당 글로 가게됨.
	@Autowired
	private QuestionsService service;
	
	@Autowired
	private AdminUtil util;
	@RequestMapping(value="/admin/customer/question/questionlist")
	public String list(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey",defaultValue="title") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		int rows=10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		total_page=util.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Questions> list=service.listQuestion(map);
		
		int listNum,n=0;
		for(Questions dto:list) {
			listNum = dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String paging=util.paging(current_page, total_page);
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("page",current_page);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",total_page);
		return ".admin4.customer.question.questionlist";
	}
	
	
	@RequestMapping(value="/customerCenter/main",method=RequestMethod.POST)
	public String article(
			@RequestParam(value="postNum") int postNum,
			@RequestParam(value="page")String page,
			@RequestParam(value="searchKey",defaultValue="1")String searchKey,
			@RequestParam(value="searchValue",defaultValue="")String searchValue,
			Model model
			)throws Exception{
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		Questions dto=service.readQeustion(postNum);
		if(dto==null)
			return "redirect:/questions/list?"+query;
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		
		Questions preReadQuestion=service.preReadQuestion(map);
		Questions nextReadQuestion=service.nextReadQuestion(map);
		model.addAttribute("dto",dto);
		model.addAttribute("preReadQuestion",preReadQuestion);
		model.addAttribute("nextReadQuestion",nextReadQuestion);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
	
		return "redirect:/customerCenter/main";
	
	}
}
