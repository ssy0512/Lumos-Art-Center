package com.sp.exhibit.schedule;

import java.net.URLDecoder;
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



@Controller("schedule.scheduleController")
public class ScheduleController {
	@Autowired
	private ScheduleService service;
	
	@Autowired
	private DateUtil dUtil;
	
	
	@RequestMapping(value="exhibit/schedule/list")
	public String main(Model model) {
		List<String> hallList = service.listHall();
		
		model.addAttribute("hallList", hallList);
		
		return "/exhibit/schedule/list";
	}
	
	// 전시 리스트 : AJAX-TEXT
	@RequestMapping(value = "exhibit/schedule/posterList")
	public String listSchedule(
			@RequestParam(value="period_type", defaultValue="thisweek") String period_type,
			@RequestParam(value="year") String year,
			@RequestParam(value="sch_hall", defaultValue="") String sch_hall,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		String query="period_type="+period_type+"&";
		
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


		model.addAttribute("list", list);
		model.addAttribute("sDate", map.get("sDate"));
		model.addAttribute("eDate", map.get("eDate"));

		return "/exhibit/schedule/posterList";
	}
	
	
	@RequestMapping(value="exhibit/scheduleToArticle")
	public String article(
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
		
		
		return ".exhibit.article";
	}
}
