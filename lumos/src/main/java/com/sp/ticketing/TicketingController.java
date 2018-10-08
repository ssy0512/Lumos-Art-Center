package com.sp.ticketing;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

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
	
	@RequestMapping(value="/ticketing/selectSeat")
	public String seatSelect(
			@RequestParam(value="sessionNum") int sessionNum,
			@RequestParam(value="hallNum") int hallNum,
			Model model) throws Exception {
		
		model.addAttribute("sessionNum",sessionNum);
		model.addAttribute("hallNum",hallNum);
		
		return ".ticketing.selectSeat";
	}
	
	@RequestMapping(value="/ticketing/book")
	public String booking(
			@RequestParam(value="sessionNum") int sessionNum,
			@RequestParam(value="hallNum") int hallNum,
			@RequestParam(value="R", defaultValue="") String[] RList,
			@RequestParam(value="S", defaultValue="") String[] SList,
			@RequestParam(value="A", defaultValue="") String[] AList,
			HttpSession session,
			Ticketing dto,
			Model model) throws Exception {
		
		String r=null;String s=null;String a=null;
		int rcnt=0;int scnt=0;int acnt=0;
		for(int i=0;i<RList.length;i++) {
			r+=RList;
			rcnt++;
		}
		for(int i=0;i<SList.length;i++) {
			s+=SList;
			scnt++;
		}
		for(int i=0;i<AList.length;i++) {
			a+=AList;
			acnt++;
		}
		int total=rcnt+scnt+acnt;
		
		// 좌석 가격 정보(+할인된 금액)
		List<Ticketing> priceList=service.seatPrice(hallNum);
		
		int[] array=new int[3];
		int size=0;
		for(Ticketing ddto : priceList) {
			array[size++]=ddto.getSeatPrice();
		}
		
		int rprice=(int)array[0]/2;
		int sprice=(int)array[1]/2;
		int aprice=(int)array[2]/2;
		
		// 가지고 있는 마일리지
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int totalMileage = service.myMileage(info.getUserId());
		
		model.addAttribute("rprice",rprice);
		model.addAttribute("sprice",sprice);
		model.addAttribute("aprice",aprice);
		model.addAttribute("array",array);
		model.addAttribute("totalMileage",totalMileage);
		model.addAttribute("total",total);
		model.addAttribute("rcnt",rcnt);
		model.addAttribute("scnt",scnt);
		model.addAttribute("acnt",acnt);
		model.addAttribute("sessionNum",sessionNum);
		model.addAttribute("hallNum",hallNum);
		
		return ".ticketing.book";
	}
}
