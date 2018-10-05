package com.sp.ticketing;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("ticketing.ticketingController")
public class TicketingController {
	@Autowired
	private TicketingService service;
	
	@RequestMapping(value="/ticketing/bookConcert", method = RequestMethod.GET)
	public String bookConcert(
			@RequestParam(value="concertNum") int concertNum,
			Model model) {
		
		Calendar cal = Calendar.getInstance();
		
		String today = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));
		
		Map<String, Object> map = new HashMap<>();
		map.put("today", today);
		map.put("concertNum",concertNum);
		List<Ticketing> list=service.sessionList(map);
		
		model.addAttribute("list",list);
		
		return ".ticketing.bookConcert";
	}
	
	@RequestMapping(value="/ticketing/sessionList")
	public String sessionList(
			@RequestParam(value="sessionDate") String sessionDate,
			Model model) throws Exception {
		
		List<Ticketing> timeList=service.timeList(sessionDate);
		
		model.addAttribute("timeList",timeList);
		return "/ticketing/sessionList";
	}
	
	@RequestMapping(value="/ticketing/seatList")
	public String seatList(
			@RequestParam(value="sessionDate") String sessionDate,
			@RequestParam(value="sessionNum") int sessionNum,
			Ticketing ticket,
			Model model) throws Exception {
		
		List<Ticketing> timeList=service.timeList(sessionDate);
		
		Map<String, Object> map = new HashMap<>();
		map.put("sessionDate", sessionDate);
		map.put("sessionNum", sessionNum);
		
		int hallNum=service.selectHallNum(sessionNum);
		ticket.setHallNum(hallNum);
		
		List<Ticketing> seatList=service.seatList(map);
		

		// 결제 후 남은 좌석 count
		/*int count=service.seatCount(sessionNum);*/
		
		model.addAttribute("ticket",ticket);
		model.addAttribute("timeList",timeList);
		model.addAttribute("seatList",seatList);
		return "/ticketing/sessionList";
	}
}
