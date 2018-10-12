package com.sp.rentfront.notice;

import java.util.ArrayList;
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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("rentnotice.NoticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/rentfront/notice/list")
	public String list(Model model) throws Exception {
		
		Calendar cal=Calendar.getInstance();
		
		String today = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));
		
		Map<String, Object> map=new HashMap<>();
		map.put("today", today);
		
		List<Notice> clist=service.listHall(map);
		List<Notice> elist=service.listExHall(map);
		
		model.addAttribute("clist", clist);
		model.addAttribute("elist", elist);
		
		return "rentfront/notice/list";
	}
	
	@RequestMapping(value="/rentfront/notice/concert/created", method=RequestMethod.GET)
	public String conCreatedForm(Model model) throws Exception {
		
		List<Notice> pList=new ArrayList<>();
		List<Notice> pList2=new ArrayList<>();
		
		Map<String, Object> map=new HashMap<>();
		pList=service.pList(map);
		pList2=service.pList2(map);
		
		model.addAttribute("mode", "created");
		model.addAttribute("pList", pList);
		model.addAttribute("pList2",pList2);
		
		return ".rentfront.notice.created";
	}
	
	@RequestMapping(value="/rentfront/notice/concert/created", method=RequestMethod.POST)
	public String conCreatedSubmit(
			@RequestParam(value="selected") String selectOption,
			@RequestParam(value="locationNum") int locationNum,
			Notice dto,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setSelectOption(selectOption);
		if(dto.getSelectOption()=="concert") {
			service.InsertConcert(dto);
		} else {
			service.InsertExhibit(dto);
		}
		
		return "redirect:/rentfront/main";
	}
}
