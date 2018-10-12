package com.sp.admin.insertCon;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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

@Controller("concerts.concScheduleController")
public class ConcScheduleController {
	@Autowired
	private ConcertsService service;
	@Autowired
	private AdminUtil util;

	
	//basic LIST 
	@RequestMapping(value="/admin/menu2/concertSchedule/insertedlist")
	public String listConcerts(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="concertNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=util.pageCount(rows, dataCount);
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1) * rows +1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Concerts> list=service.listConcerts(map);
		int listNum,n=0;
		Iterator<Concerts> it = list.iterator();
		while(it.hasNext()) {
			Concerts data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		String query="";
		String listUrl=cp+"/admin/menu2/concertSchedule/insertedlist";
		String articleUrl=cp+"/admin/menu2/concertSchedule/article?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		if(query.length()!=0) {
			listUrl=cp+"/admin/menu2/concertSchedule/insertedlist?"+query;
			articleUrl=cp+"/admin/menu2/concertSchedule/artice?page="+current_page+"&"+query;
		}
		
		String paging=util.paging(current_page, total_page,listUrl);
		//model.addAttribute("subMenu","2"); dont know what this is for.... 
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		
		return ".admin4.menu2.concertSchedule.insertedlist";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/article")
	public String article(@RequestParam(value="concertNum",defaultValue="1") int concertNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="concertNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		String query="page="+page;
		if(searchValue.length()!=0) {
			query="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Concerts dto= service.readConcertList(concertNum);
		if(dto==null)
			return "redirect:admin/menu2/concertSchedule/listConcerts?"+query;
		
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		
		
		return ".admin4.menu2.concertSchedule.article";
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/created",method=RequestMethod.GET)
	public String created(Model model) throws Exception{
		
		List<Concerts> listHall = new ArrayList<>();
		listHall=service.listHall();
		
		List<Concerts> listRate=new ArrayList<>();
		listRate=service.listRate();
		
		
		
		model.addAttribute("listHall",listHall);
		model.addAttribute("listRate",listRate);
		model.addAttribute("page","1");
		model.addAttribute("mode","created");
		
		return ".admin4.menu2.concertSchedule.created";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/created",method=RequestMethod.POST)
	public String insertConOk (Concerts dto,HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"concertSchedule";
		service.insertConcert(dto,path);
		
		return "redirect:/admin4/menu2/concertSchedule/insertedlist";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/created2",method=RequestMethod.GET)
	public String created2 (Model model) throws Exception {
		
		model.addAttribute("page","1");
		model.addAttribute("mode","created2");
		return ".admin4.menu2.concertSchedule.created2";

	}
	
	public String created2Ok(Concerts dto) throws Exception {
		service.insertSession(dto);
		return "redirect:/admin4/menu2/concertSchedule/article";
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/pricingInsert",method=RequestMethod.GET)
	public String insertPrice(Model model) throws Exception{
		List<Concerts> listnames = new ArrayList<>();
		listnames=service.listnames();
		
		List<Concerts> listLevel=new ArrayList<>();
		listLevel = service.listLevel();
		
		model.addAttribute("listLevel",listLevel);
		model.addAttribute("listnames",listnames);
		model.addAttribute("mode","pricingInsert");
		
		return ".admin4.menu2.concertSchedule.pricingInsert";
		
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/pricingInsert",method=RequestMethod.POST)
	public String priceOk(Concerts dto) throws Exception{
		service.insertPrice(dto);
		return ".admin4.menu2.concertSchedule.inserted";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/pricinglist")
	public String listPrices(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="concertNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page=util.pageCount(rows, dataCount);
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1) * rows +1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Concerts> list=service.listConcerts(map);
		int listNum,n=0;
		Iterator<Concerts> it = list.iterator();
		while(it.hasNext()) {
			Concerts data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		String query="";
		String listUrl=cp+"/admin/menu2/concertSchedule/pricinglist";
		String articleUrl=cp+"/admin/menu2/concertSchedule/article2?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		if(query.length()!=0) {
			listUrl=cp+"/admin/menu2/concertSchedule/pricinglist?"+query;
			articleUrl=cp+"/admin/menu2/concertSchedule/artice2?page="+current_page+"&"+query;
		}
		
		String paging=util.paging(current_page, total_page,listUrl);
		//model.addAttribute("subMenu","2"); dont know what this is for.... 
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		
		return ".admin4.menu2.concertSchedule.pricinglist";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/update", method=RequestMethod.GET)
	public String updateConcert(@RequestParam(value="concertNum") int concertNum,
			@RequestParam(value="page",defaultValue="1")String page,
			Model model) throws Exception{
		
		Concerts dto=service.readConcertList(concertNum);
		if(dto==null) {
			return "redirect:/menu2/concertSchedule/insertedlist?page="+page; //error 
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("dto",dto);
		
		return ".admin4.menu2.concertSchedule.created";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/update", method=RequestMethod.POST)
	public String updateConcertSubmit (Concerts dto, @RequestParam String page,HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"upload"+File.separator+"concertSchedule"; //수정해야할수도있음
		service.updateConcerts(dto,path);
		
		return "redirect:/menu2/concertSchedule/article?listNum="+dto.getListNum()+"&page="+page;
	}
	/*public String updateSession(@RequestParam(value="concertNum") int concertNum,
			@RequestParam(value="page",defaultValue="1")String page,
			Model model) throws Exception{
		Concerts dto = service.read
	}*/
	@RequestMapping(value="/admin/menu2/concertSchedule/delete", method=RequestMethod.POST)
	public String deleteConcert (@RequestParam(value="concertNum") int concertNum,
							@RequestParam String page, HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"upload"+File.separator+"concertSchedule";
		service.deleteConcerts(concertNum,path);
	
		return "redirect:/menu2/concertSchedule/insertedlist?page="+page;
	}
	
}
