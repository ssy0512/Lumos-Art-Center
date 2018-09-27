package com.sp.academy.review;

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

import com.sp.academy.Academy;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("academyreview.AcademyReviewController")
public class AcademyReviewController {
	@Autowired
	private AcademyReviewService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/academy/review/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { 
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
        
        dataCount=service.dataCount(map);
        if(dataCount!=0)
        	total_page=myUtil.pageCount(rows, dataCount);
        
        if(total_page<current_page)
        	current_page=total_page;
        
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
        
        List<AcademyReview> list=service.listReview(map);
        
        int listNum, n=0;
        Iterator<AcademyReview> it=list.iterator();
        while(it.hasNext()) {
        	AcademyReview data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query="";
        String listUrl=cp+"/academy/review/list";
        String articleUrl=cp+"/academy/review/article?page="+current_page;
        if(searchValue.length()!=0) {
        	query="searchKey=" +searchKey + 
       	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
        }
        
        if(query.length()!=0) {
        	listUrl=cp+"/academy/review/list?"+query;
        	articleUrl=cp+"/academy/review/article?page="+current_page;
        }
		
        String paging=myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return ".academy.review.list";
	}
	
	@RequestMapping(value="/academy/review/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<Academy> sbList=new ArrayList<>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		sbList=service.sbList(map);
		
		model.addAttribute("sbList", sbList);
		model.addAttribute("mode", "created");
		
		return ".academy.review.created";
	}
	
	@RequestMapping(value="/academy/review/created", method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam(value="academyNum") int academyNum,
			AcademyReview dto, 
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null) {
				return "redirect:/member/login";
			}
			
		dto.setUserId(info.getUserId());
		dto.setAcademyNum(academyNum);
		
		service.insertReview(dto);
		
		return "redirect:/academy/review/list";
	}
	
	@RequestMapping(value="/academy/review/article")
	public String article(
			@RequestParam(value="classReviewNum") int classReviewNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		service.updateHitCount(classReviewNum);
		
		AcademyReview dto=service.readReview(classReviewNum);
		if(dto==null)
			return "redirect:/academy/view/list?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("classReviewNum", classReviewNum);
		
		AcademyReview preReviewDto=service.preReview(map);
		AcademyReview nextReviewDto=service.nextReview(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReviewDto", preReviewDto);
		model.addAttribute("nextReviewDto", nextReviewDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".academy.review.article";
	}
	
	@RequestMapping(value="/academy/review/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int classReviewNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		AcademyReview dto=service.readReview(classReviewNum);
		if(dto==null)
			return "redirect:/academy/view/list?page="+page;
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page="+page;
		}
		
		List<Academy> sbList=new ArrayList<>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		sbList=service.sbList(map);
		
		model.addAttribute("sbList", sbList);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".academy.review.created";
	}
	 
	@RequestMapping(value="/academy/review/update", method=RequestMethod.POST)
	public String updateSubmit(
			AcademyReview dto,
			@RequestParam(value="academyNum", defaultValue="") int academyNum,
			@RequestParam String page
			) throws Exception {
		
		dto.setAcademyNum(academyNum);
		
		service.updateReview(dto);
		
		return "redirect:/academy/review/list?="+page;
	}
	
	@RequestMapping(value="/academy/review/delete")
	public String delete(
			@RequestParam int classReviewNum,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		service.deleteReview(classReviewNum, info.getUserId());
		
		return "redirect:/academy/review/list?page="+page;
	}

	
}
