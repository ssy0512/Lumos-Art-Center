package com.sp.community.event;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.member.SessionInfo;

@Controller("commnity.eventController")
public class EventController {
	@Autowired
	private EventService service;
	
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
	
	@RequestMapping(value="/community/event/past")
	public String past() {
		
		return "/community/event/past";
	}
}
