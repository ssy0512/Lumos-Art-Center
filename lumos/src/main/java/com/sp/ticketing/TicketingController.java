package com.sp.ticketing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("ticketing.ticketingController")
public class TicketingController {
	
	@RequestMapping(value="/ticketing/bookConcert", method = RequestMethod.GET)
	public String bookConcert() {
		return ".ticketing.bookConcert";
	}
}
