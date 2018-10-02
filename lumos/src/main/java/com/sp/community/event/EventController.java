package com.sp.community.event;

import java.io.File;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.HashMap;
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

@Controller("commnity.eventController")
public class EventController {
	@Autowired
	private EventService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/community/event/eventTab", method = RequestMethod.GET)
	public String method() {
		return ".community.event.eventTab";
	}
	
	@RequestMapping(value="/community/event/ongoing")
	public String ongoing(Model model) throws Exception{
		Calendar cal = Calendar.getInstance();

		String today = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));
		
		Map<String, Object> map = new HashMap<>();
		map.put("today",today);
		
		List<Event> list=service.eventList(map);
		
		model.addAttribute("list",list);
		
		return "/community/event/ongoing";
	}
	
	@RequestMapping(value="/admin/community/event/created" , method=RequestMethod.GET)
	public String createdForm(Model model) {
		model.addAttribute("mode","created");
		
		return ".community.event.created";
	}
	
	@RequestMapping(value="/admin/community/event/created" , method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam(value="selected") String selectOption,
			Event dto,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "image";		
		
		dto.setSelectOption(selectOption);
		dto.setUserId(info.getUserId());
		service.insertEvent(dto,pathname);
		
		return "redirect:/community/event/eventTab";
	}
	
	@RequestMapping(value = "/community/event/article", method = RequestMethod.GET)
	public String article(
			@RequestParam(value="eventNum") int eventNum,
			Model model) throws Exception  {
		
		Event dto = service.readEvent(eventNum);
		if(dto==null)
			return "redirect:/community/event/eventTab";
		
		model.addAttribute("dto", dto);

		return ".community.event.article";
	}
	
	@RequestMapping(value = "/admin/community/event/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="eventNum") int eventNum,
			Model model) throws Exception  {
		
		Event dto = service.readEvent(eventNum);
		if(dto==null)
			return "redirect:/community/event/eventTab";
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode","update");
		
		return ".community.event.created";
	}
	
	@RequestMapping(value = "/admin/community/event/update", method = RequestMethod.POST)
	public String updateSubmit(
			@RequestParam(value="selected") String selectOption,
			Event dto,
			HttpSession session) throws Exception  {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "image";		
		
		dto.setSelectOption(selectOption);
		service.updateEvent(dto, pathname);
		
		return "redirect:/community/event/eventTab";
	}
	
	@RequestMapping(value = "/admin/community/event/delete", method = RequestMethod.GET)
	public String delete(
			@RequestParam(value="eventNum") int eventNum,
			HttpSession session) throws Exception  {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "image";	
		
		Event dto = service.readEvent(eventNum);
		if(dto==null)
			return "redirect:/community/event/eventTab";
		
		pathname+=File.separator+dto.getSaveFilename();
		
		service.deleteEvent(eventNum,pathname);

		return "redirect:/community/event/eventTab";
	}
	
	// 댓글 리스트 : AJAX-TEXT
	@RequestMapping(value="/community/event/listReply")
	public String listReply(
			@RequestParam int eventNum
			,@RequestParam(value="pageNo", defaultValue="1") int current_page
			,Model model
			) throws Exception {
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("eventNum", eventNum);
		
		dataCount=service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		List<Reply> listReply=service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			if(dto.getUserName().length()==2)
				dto.setUserName(dto.getUserName().substring(0,1)+'*');
		}
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("paging", paging);
		
		return "community/event/listReply";
	}
	
	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@RequestMapping(value="/community/event/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		int result=service.insertReply(dto);
		if(result==0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@RequestMapping(value="/community/event/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		String state="true";
		service.deleteReply(paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	@RequestMapping(value="/community/event/past")
	public String past(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Calendar cal = Calendar.getInstance();

		String today = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("today",today);
		map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
		
		if(info.getUserId().equals("admin")) {
			dataCount=service.endListCount(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			if(current_page>total_page)
				current_page=total_page;
			
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			
			List<Event> endList=service.endList(map);
			
			String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			List<Event> endUserList=service.endUserList(map);
			
			model.addAttribute("endUserList",endUserList);
			model.addAttribute("endList",endList);
			model.addAttribute("paging", paging);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
		}else {
			dataCount=service.endUserListCount(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			
			List<Event> endUserList=service.endUserList(map);
			
			String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			List<Event> endList=service.endList(map);
			
			model.addAttribute("endList",endList);
			model.addAttribute("endUserList",endUserList);
			model.addAttribute("paging", paging);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
		}
			
			return "/community/event/past";
	}
	
	@RequestMapping(value = "/community/event/endArticle", method = RequestMethod.GET)
	public String endArticle(
			@RequestParam(value="eventNum") int eventNum,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo") String page,
			HttpServletRequest req,
			Model model) throws Exception  {
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Event dto = service.readEvent(eventNum);
		if(dto==null)
			return "redirect:/community/event/eventTab";
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("eventNum", eventNum);
	
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", page);

		return ".community.event.endArticle";
	}
	
	@RequestMapping(value = "/admin/community/event/endUpdate", method = RequestMethod.GET)
	public String endUpdateForm(
			@RequestParam(value="eventNum") int eventNum,
			Model model) throws Exception  {
		
		Event dto = service.readEvent(eventNum);
		if(dto==null)
			return "redirect:/community/event/eventTab";
		
		model.addAttribute("dto", dto);
		
		return ".community.event.endCreated";
	}
	
	@RequestMapping(value = "/admin/community/event/endUpdate", method = RequestMethod.POST)
	public String endUpdateSubmit(
			Event dto,
			HttpSession session) throws Exception  {
		
		service.endUpdateEvent(dto);
		
		return "redirect:/community/event/eventTab";
	}
}
		
