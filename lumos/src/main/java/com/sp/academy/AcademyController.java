package com.sp.academy;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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


@Controller("Academy.academyController")
public class AcademyController {	
	@Autowired
	private AcademyService service; 
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/academy/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="academyName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="mode", defaultValue="ing") String mode,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		
		int rows=8;
		int total_page=0;
		int dataCount=0;
		int applyDateCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("mode", mode);
		
		dataCount=service.dataCount(map);
		if(dataCount!= 0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
				
		List<Academy> list=service.listAcademy(map);
		
		Date todayDate=new Date();
		long gap;
		
		int listNum, n=0;
		
		Iterator<Academy> it=list.iterator();
		
		while(it.hasNext()) {
			Academy data=it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			Date eDate=format.parse(data.getEndDate());
			
			gap=(todayDate.getTime()-eDate.getTime())/(24*60*60*1000);
			data.setGap(gap);
			
			if(gap<=0) {
				mode="ing";
			} else {
				mode="finish";
			}
			
			data.setMode(mode);
			
			n++;			
		}
		
		String query="";
		String listUrl=cp+"/academy/list";
		String articleUrl=cp+"/academy/article?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		} 
		
		if(query.length()!=0) {
			listUrl=cp+"/academy/list?"+query;
			articleUrl=cp+"/academy/article?page="+current_page+"&"+query;
		}
				
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("applyDateCount", applyDateCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("mode", mode);
		
		return ".academy.list";
	}
	
	@RequestMapping(value="/academy/article")
	public String article(
			@RequestParam(value="mode") String mode,
			@RequestParam(value="academyNum") int academyNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="academyName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}

		// 해당 레코드 가져 오기
		Academy dto=service.readAcademy(academyNum);				
		if(dto==null)
			return "redirect:/academy/list?"+query;		
			
		dto.setMode(mode);
		
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("academyNum", academyNum);
		
		model.addAttribute("dto", dto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
        return ".academy.article";
	}
	
	@RequestMapping(value="/academy/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int academyNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		Academy dto=service.readAcademy(academyNum);
		if(dto==null) {
			return "redirect:/academy/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		
		return ".academy.created";
	}

	@RequestMapping(value="/academy/update", method=RequestMethod.POST)
	public String updateSubmit(
			Academy dto,
			@RequestParam int academyNum, 
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"image";
		
		service.updateInfo(dto, pathname);
		
		return "redirect:/academy/list?page"+page;
	}
	
	@RequestMapping(value="/academy/mylecture")
	public String mylecture(
			@RequestParam(value="academyNum") int academyNum,
			@RequestParam(value="page") String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		String query="";
		
		// 해당 레코드 가져 오기
		Academy dto=service.readAcademy(academyNum);				
		if(dto==null)
			return "redirect:/academy/list?"+query;	
		
		if(academyNum==0) {
			return "redirect:/academy/list?"+query;
		} 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("academyNum", academyNum);

		model.addAttribute("dto", dto);
		
        return ".academy.mylecture";
	}
	
}
