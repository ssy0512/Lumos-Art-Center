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
			@RequestParam(value="R", required=false) String[] RList,
			@RequestParam(value="S", required=false) String[] SList,
			@RequestParam(value="A", required=false) String[] AList,
			HttpSession session,
			Model model) throws Exception {
		
		
		String r="";String s="";String a="";
		int rcnt=0;int scnt=0;int acnt=0;
		
		if(RList!=null) {
			for(int i=0;i<RList.length;i++) {
				r+=RList[i]+",";
				rcnt++;
			}
		}
		
		if(SList!=null) {
			for(int i=0;i<SList.length;i++) {
				s+=SList[i]+",";
				scnt++;
			}
		}
		
		if(AList!=null) {
			for(int i=0;i<AList.length;i++) {
				a+=AList[i]+",";
				acnt++;
			}
		}
		int total=rcnt+scnt+acnt;
		String bookedSeatNum=r+s+a;
		bookedSeatNum=bookedSeatNum.substring(0,bookedSeatNum.length()-1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("hallNum", hallNum);
		map.put("sessionNum", sessionNum);
		
		// 좌석 가격 정보(+할인된 금액)
		List<Ticketing> priceList=service.seatPrice(map);

		int[] array=new int[3];
		int size=0;
		for(Ticketing ddto : priceList) {
			array[size]=ddto.getSeatPrice();
			size++;
		}
		
		int rprice=(int)array[0]/2;
		int sprice=(int)array[1]/2;
		int aprice=(int)array[2]/2;
		
		// 가지고 있는 마일리지
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int totalMileage = service.myMileage(info.getUserId());
		
		model.addAttribute("bookedSeatNum",bookedSeatNum);
		model.addAttribute("rprice",rprice);
		model.addAttribute("sprice",sprice);
		model.addAttribute("aprice",aprice);
		model.addAttribute("array0",array[0]);
		model.addAttribute("array1",array[1]);
		model.addAttribute("array2",array[2]);
		model.addAttribute("totalMileage",totalMileage);
		model.addAttribute("total",total);
		model.addAttribute("rcnt",rcnt);
		model.addAttribute("scnt",scnt);
		model.addAttribute("acnt",acnt);
		model.addAttribute("sessionNum",sessionNum);
		model.addAttribute("hallNum",hallNum);
		
		return ".ticketing.book";
	}
	
	@RequestMapping(value="/ticketing/finalBook")
	public String finalBook(
			@RequestParam(value="hallNum") int hallNum,
			@RequestParam(value="sessionNum") int sessionNum,
			@RequestParam(value="array0", defaultValue="0") int array0,
			@RequestParam(value="array1", defaultValue="0") int array1,
			@RequestParam(value="array2", defaultValue="0") int array2,
			@RequestParam(value="bookedSeatNum") String bookedSeatNum,
			@RequestParam(value="trcnt", defaultValue="0") int trcnt,
			@RequestParam(value="salercnt", defaultValue="0") int salercnt,
			@RequestParam(value="tscnt", defaultValue="0") int tscnt,
			@RequestParam(value="salescnt", defaultValue="0") int salescnt,
			@RequestParam(value="tacnt", defaultValue="0") int tacnt,
			@RequestParam(value="saleacnt", defaultValue="0") int saleacnt,
			@RequestParam(value="mileage", defaultValue="0") int mileage,
			Ticketing dto,
			Model model) {
		
		List<Ticketing> list=service.sessionDate(sessionNum);
		for(Ticketing ddto:list) {
			dto.setSessionDate(ddto.getSessionDate());
			dto.setSessionTime(ddto.getSessionTime());
			dto.setConcertName(ddto.getConcertName());
		}
		
		String[] sp=bookedSeatNum.split(",");
		int total=sp.length;
		
		int rprice=(int)array0/2;
		int sprice=(int)array1/2;
		int aprice=(int)array2/2;
		
		int totalPrice=array0*(trcnt+salercnt)+array1*(tscnt+salescnt)+array2*(tacnt+saleacnt);
		int discount=rprice*salercnt+sprice*salescnt+aprice+saleacnt+mileage;
		int price=totalPrice-discount;
		
		int time=Integer.parseInt(dto.getSessionTime().substring(0, 2))-1;
		String min=dto.getSessionTime().substring(2);
		
		String cancelTime=dto.getSessionDate() +"  "+ time + min;
		
		model.addAttribute("dto",dto);
		model.addAttribute("bookedSeatNum",bookedSeatNum);
		model.addAttribute("total",total);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("discount",discount);
		model.addAttribute("price",price);
		model.addAttribute("cancelTime",cancelTime);
		
		return ".ticketing.finalBook";
	}
}
