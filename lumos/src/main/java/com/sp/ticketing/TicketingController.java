package com.sp.ticketing;

import java.util.List;

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
		
		List<Ticketing> list=service.sessionList(concertNum);
		
		model.addAttribute("list",list);
		
		return ".ticketing.bookConcert";
	}
	
	@RequestMapping(value="/ticketing/sessionList")
	public String sessionList(
			@RequestParam(value="sessionDate") String sessionDate,
			Model model) throws Exception {
		return "/ticketing/sessionList";
	}
}
