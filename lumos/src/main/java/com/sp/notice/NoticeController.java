package com.sp.notice;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customerCenter.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service; 
	@Autowired
	private MyUtil myUtil;

	
	@RequestMapping(value="/customerCenter/notice/list")
	public String list( 
			@RequestParam(value="page" , defaultValue="1") int current_page,
			@RequestParam(value="searchKey" , defaultValue="title") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		
		int rows = 10;
 		int total_page=0;
		int dataCount=0;
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
			
		List<Notice> noticeList = null;
		if(current_page==1) {
			noticeList=service.listNoticeTop();
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
				
		List<Notice> list = service.listNotice(map);
		
		int lisNum, n =0;
		Iterator<Notice> it = list.iterator();

		while(it.hasNext()) {
			Notice data =it.next();
			lisNum = dataCount -(start + n -1);
			data.setListNum(lisNum);
		
			data.setCreated(data.getCreated().substring(0, 10));
			
			n++;
		}
		
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("list" , list);
		model.addAttribute("page" , current_page);
		model.addAttribute("dataCount" , dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging" , paging);

		return "customerCenter/notice/list";
	}
	
	@RequestMapping(value="/customerCenter/notice/created" ,method=RequestMethod.GET)
	public String createdForm(
			Model model , 
			HttpSession session
			) throws Exception{
		
		model.addAttribute("page", "1");
		model.addAttribute("mode", "created");
		return "customerCenter/notice/created";
	}
	
	@RequestMapping(value="/customerCenter/notice/created" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) {
			dto.setUserId(info.getUserId());
			service.insertNotice(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	@RequestMapping(value="/customerCenter/notice/article")
	public String article(
			@RequestParam(value="noticeNum" ) int noticeNum, 
			@RequestParam(value="page") String page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		service.updateHitCount(noticeNum);
		
		Notice dto = service.readNotice(noticeNum);
		if(dto==null) {
			return "customerCenter/error";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("noticeNum", noticeNum);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		model.addAttribute("dto",dto);
		model.addAttribute("preReadDto" , preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page" , page);
		
		return "customerCenter/notice/article";
	}
	
	
	@RequestMapping(value="/customerCenter/notice/update" , method =RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="noticeNum") int noticeNum ,
			@RequestParam(value="page") String page,
			HttpSession session , 
			Model model
			) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getUserId().equals("admin")) {
			return "customerCenter/error";
		}
		
		Notice dto = service.readNotice(noticeNum);
		
		if(dto==null) {
			return "customerCenter/error";
		}
		
		model.addAttribute("mode" , "update");
		model.addAttribute("page" , page);
		model.addAttribute("dto" , dto);
			
		return "customerCenter/notice/created";

	}
	
	@RequestMapping(value="/customerCenter/notice/update" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Notice dto,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) {
			dto.setUserId(info.getUserId());
			service.updateNotice(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/customerCenter/notice/delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int noticeNum,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) {
			service.deleteNotice(noticeNum);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
}

