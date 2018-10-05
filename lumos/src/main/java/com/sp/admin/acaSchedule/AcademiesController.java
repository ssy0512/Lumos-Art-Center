package com.sp.admin.acaSchedule;

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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("academies.academiesController")
public class AcademiesController {
	@Autowired
	private AcademiesService service;
	@Autowired
	private MyUtil util;

	
	//basic LIST 
	@RequestMapping(value="/admin/menu2/academySchedule/academylist")
	public String listConcerts(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="academyNum") String searchKey,
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
		
		List<Academies> list=service.listAcademies(map);
		int listNum,n=0;
		Iterator<Academies> it = list.iterator();
		while(it.hasNext()) {
			Academies data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		String query="";
		String listUrl=cp+"/admin/menu2/academySchedule/academylist";
		String articleUrl=cp+"/admin/menu2/academySchedule/article?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		if(query.length()!=0) {
			listUrl=cp+"/admin/menu2/academySchedule/academylist?"+query;
			articleUrl=cp+"/admin/menu2/academySchedule/artice?page="+current_page+"&"+query;
		}
		
		String paging=util.paging(current_page, total_page,listUrl);
		//model.addAttribute("subMenu","2"); dont know what this is for.... 
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		
		return ".admin4.menu2.academySchedule.academylist";
	}
	
	
	@RequestMapping(value="/admin/menu2/academySchedule/academyCards")
	public String listCards(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="academyNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:.member.login";
		}
		
		String cp = req.getContextPath();
		
		int rows = 16;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
		
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = util.pageCount(rows, dataCount);
        
        if(total_page < current_page) 
            current_page = total_page;
        
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
        
        List<Academies> list= service.listAcademies(map);
        
        int listNum, n = 0;
        Iterator<Academies> it = list.iterator();
        while (it.hasNext()) {
        	Academies data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
            n++;
		}
        
        String query = "";
        String listUrl = cp+"/admin/menu2/academySchedule/academyCards";
        String articleUrl = cp+"/admin/menu2/academySchedule/article?page="+current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        if(query.length()!=0) {
        	listUrl = cp+"/admin/menu2/academySchedule/academyCards?"+query;
        	articleUrl = cp+"/admin/menu2/academySchedule/article?page=" + current_page + "&"+ query;
        }
        
        String paging = util.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".admin4.menu2.academySchedule.academyCards";
	}

	
	@RequestMapping(value="/admin/menu2/academySchedule/article")
	public String article(@RequestParam(value="academyNum",defaultValue="1") int academyNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="1") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		String query="page="+page;
		if(searchValue.length()!=0) {
			query="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Academies dto= service.readAcademies(academyNum);
		if(dto==null)
			return "redirect:admin/menu2/academySchedule/academylist?"+query;
		
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		
		
		return ".admin4.menu2.academySchedule.article";
	}
	@RequestMapping(value="/admin/menu2/academySchedule/created",method=RequestMethod.GET)
	public String created(Model model) throws Exception{
		
		List<Academies> listRoom = new ArrayList<>();
		listRoom=service.listRoom();
		
		List<Academies> listInst=new ArrayList<>();
		listInst=service.listInst();
		
		model.addAttribute("listRoom",listRoom);
		model.addAttribute("listInst",listInst);
		model.addAttribute("page","1");
		model.addAttribute("mode","created");
		
		return ".admin4.menu2.academySchedule.created";
	}
	
	@RequestMapping(value="/admin/menu2/academySchedule/created",method=RequestMethod.POST)
	public String createdOk (Academies dto,HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"images";
		service.insertAcademies(dto, pathname);
		
		return "redirect:/admin4/menu2/academySchedule/academylist";
	}
	
	@RequestMapping(value="/admin/menu2/academySchedule/update", method=RequestMethod.GET)
	public String updateAcademies(@RequestParam(value="academyNum") int academyNum,
			@RequestParam(value="page",defaultValue="1")String page,
			Model model) throws Exception{
		
		Academies dto=service.readAcademies(academyNum);
		if(dto==null) {
			return "redirect:/menu2/academySchedule/academylist?page="+page; //error 
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("dto",dto);
		
		return ".admin4.menu2.academySchedule.created";
	}
	
	@RequestMapping(value="/admin/menu2/academySchedule/update", method=RequestMethod.POST)
	public String updateSubmit (Academies dto, @RequestParam String page,HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"upload"+File.separator+"photo"; //수정해야할수도있음
		service.updateAcademies(dto, pathname);
		
		return "redirect:/menu2/academySchedule/article?listNum="+dto.getListNum()+"&page="+page;
	}
	
	@RequestMapping(value="/admin/menu2/academySchedule/delete", method=RequestMethod.POST)
	public String deleteConcert (@RequestParam(value="academyNum") int academyNum,
							@RequestParam String page, HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"upload"+File.separator+"photo";
		service.deleteAcademies(academyNum, pathname);
	
		return "redirect:/menu2/academySchedule/academylist?page="+page;
	}
	
}
