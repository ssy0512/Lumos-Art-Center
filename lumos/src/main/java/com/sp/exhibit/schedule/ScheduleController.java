package com.sp.exhibit.schedule;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.exhibit.Exhibit;
import com.sp.exhibit.ExhibitService;



@Controller("exhibit.scheduleController")
public class ScheduleController {
	@Autowired
	private ScheduleService service;
	
	@Autowired
	private ExhibitService exhibitService;
	
	@Autowired
	private DateUtil dUtil;
	
	
	@RequestMapping(value="exhibit/schedule/list")
	public String main(
			@RequestParam(value="period_type", defaultValue="thisweek") String period_type,
			@RequestParam(value="year") String year,
			@RequestParam(value="sch_hall", defaultValue="") String sch_hall,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		List<String> hallList = service.listHall();
		
		
		String query="period_type="+period_type+"&year="+year;
		if(sch_hall.length()!=0) {
			query+="&sch_hall="+sch_hall;
		}
			
		if(searchValue.length()!=0) {
			query+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("searchValue", searchValue);
		 
		 List<String> listSch_hall=null;
			if(sch_hall.length()!=0)
				listSch_hall=Arrays.asList(sch_hall.split(","));
		 map.put("listSch_hall", listSch_hall);
		 
		 // 오늘 날짜 저장
		 String sysdate = dUtil.syadateToString();
		 
		 // 검색 기간
		 if(period_type.equals("all")) {
			 map.put("sDate", year+"-01-01");
			 map.put("eDate", year+"-12-31");
		 } else if(period_type.equals("thisweek")) {
			 map.put("sDate", sysdate);
			 map.put("eDate", dUtil.toWeekEnd(sysdate));
		 } else if(period_type.equals("nextweek")) {
			 map.put("sDate", dUtil.nextWeekStart(sysdate));
			 map.put("eDate", dUtil.nextWeekEnd(sysdate));
		 } else if(period_type.equals("month")) {
			 map.put("sDate", sysdate);
			 map.put("eDate", dUtil.toMonthsLater(sysdate, 1));
		 } else if(period_type.equals("threemonths")) {
			 map.put("sDate", sysdate);
			 map.put("eDate", dUtil.toMonthsLater(sysdate, 3));
		 }
		 
		List<Schedule> list = service.listSchedule(map);

		model.addAttribute("sDate", map.get("sDate"));
		model.addAttribute("eDate", map.get("eDate"));
		model.addAttribute("hallList", hallList);
		
		model.addAttribute("list", list);
		model.addAttribute("query", query);

		model.addAttribute("period_type", period_type);
		model.addAttribute("year", year);
		model.addAttribute("sch_hall", sch_hall);
		model.addAttribute("searchValue", searchValue);
		
		return "/exhibit/schedule/list";
	}
	
	@RequestMapping(value="exhibit/scheduleToArticle")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="period_type", defaultValue="thisweek") String period_type,
			@RequestParam(value="year") String year,
			@RequestParam(value="sch_hall", defaultValue="") String sch_hall,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		String query="period_type="+period_type+"&year="+year;
		if(sch_hall.length()!=0) {
			query+="&sch_hall="+sch_hall;
		}
			
		if(searchValue.length()!=0) {
			query+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Exhibit dto = exhibitService.readBoard(num);
		if(dto==null) {
			return "redirect:/exhibit/main";
		}
		
		List<String> listPrice = exhibitService.exhibitPrice(num);
		
		if(listPrice!=null && listPrice.size() > 0) {
			String exPriceString="";
			for( String s : listPrice) {
				exPriceString+=s+" / ";
			}
			exPriceString=exPriceString.substring(0, exPriceString.length()-3);
			dto.setExPriceString(exPriceString);
		}
		
		model.addAttribute("query", query);
		model.addAttribute("dto", dto);
		return ".exhibit.article";
	}
}
