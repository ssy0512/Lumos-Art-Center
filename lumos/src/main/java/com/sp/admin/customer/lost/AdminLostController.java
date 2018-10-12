package com.sp.admin.customer.lost;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.AdminUtil;
import com.sp.common.MyUtil;
import com.sp.member.Member;


@Controller("admin.customer.lostController")
public class AdminLostController {
	@Autowired
	private AdminLostService service;
	@Autowired
	private AdminUtil util;


	@RequestMapping(value="/admin/customer/lost/main",method=RequestMethod.GET) 
	public String listLostForm( 
			@RequestParam(value="page" , defaultValue="1") int current_page,
			@RequestParam(value="searchKey" , defaultValue="title") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{



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

		List<Lost> list=service.listLost(map);
		int listNum , n =0;
		Iterator<Lost> it = list.iterator();
		while(it.hasNext()) {
			Lost data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp+"/admin/customer/lost/main";
		String articleUrl = cp="/admin/customer/lost/article?page="+current_page;

		if(searchValue.length()!=0) {
			listUrl = cp+"/admin/customer/lost/main?"+query;
			articleUrl=cp+"/admin/customer/lost/article?page="+current_page;
		}
		String paging=util.paging(current_page, total_page,listUrl);

		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);

		return ".admin4.customer.lost.list";
	}

	@RequestMapping(value="/admin/customer/lost/article",method=RequestMethod.GET) 
	public String articleLostForm (
			@RequestParam(value="page" , defaultValue="1") int current_page,
			@RequestParam(value="lostNum") int lostNum,
			Model model
			) throws Exception {

		Lost list = service.readLost(lostNum);
		model.addAttribute("dto",list);
		model.addAttribute("page",current_page);

		return ".admin4.customer.lost.article";
	}

	@RequestMapping(value="/admin/customer/lost/article",method=RequestMethod.POST) 
	public String articleLost (
			@RequestParam(value="page" , defaultValue="1") int current_page,
			@RequestParam(value="status") int status,
			@RequestParam(value="lostNum") int lostNum,
			Model model
			) throws Exception {

		Email email = new Email();
		Lost dto = new Lost();
		dto.setLostNum(lostNum);
		dto.setLostStatus(status);

		try
		{
			service.updateLostStatus(dto);
			
			// email
			Lost emailDTO = service.readLost(lostNum);
			String userEmail = emailDTO.getEmail();
			String statusName = emailDTO.getLostStatusName();
			String lostName = emailDTO.getLostName();
			
			email.mailSend(userEmail, lostName, statusName);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return "redirect:/admin/customer/lost/main?page=" + current_page;
	}


	@RequestMapping(value="/customerCenter/lostproperty/list",method=RequestMethod.GET) 
	public String createLostForm (Model model) throws Exception{

		return "customerCenter/lostproperty/created";
	}
	
	@RequestMapping(value="/customerCenter/lostproperty/list",method=RequestMethod.POST) 
	public String createLost(
			Lost dto
			,Model model
			)
	{

		StringBuffer sb = new StringBuffer();

		try
		{
			service.insertLost(dto);
			sb.append(dto.getLostPerson() + "님의 유실물이 접수되었습니다.<br/>진행 상황은 이메일 (" + dto.getEmail() + ") 에서 확인할 수 있습니다.<br/>");

		}
		catch(Exception e)
		{
			sb.append(dto.getLostPerson() + "님의 유실물 접수 문의가 실패했습니다. 관리자에게 문의하세요.<br/>");
		}

		model.addAttribute("message", sb.toString());
		model.addAttribute("title", "회원 가입");

		return ".member.member_lost_ok"; 
	}
	
	
	



}