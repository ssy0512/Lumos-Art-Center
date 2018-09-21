package com.sp.exhibit.annual;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.exhibit.schedule.Schedule;
import com.sp.exhibit.schedule.ScheduleService;

@Controller("exhibit.annualController")
public class AnnualController {
	@Autowired
	private ScheduleService service;
	@RequestMapping(value="exhibit/annual/list")
	public String main(
			@RequestParam(name="year", defaultValue="0") int year,
			Model model
			) {
		
		try {
			Calendar cal=Calendar.getInstance();
			int y=cal.get(Calendar.YEAR);
			
			int todayYear=cal.get(Calendar.YEAR);
			String today=String.format("%04d%02d%02d",
					cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));

			if(year<1900)
				year=y;
			
			Map<String, Object> map = new HashMap<>();
			map.put("year", year);
			List<Schedule> list = service.listAnnuallySchedule(map);
			
			//List<String> listMap=new ArrayList<>();
			
			for (Schedule dto : list) {
				int startmonth = Integer.parseInt(dto.getStartmonth());
				int endmonth = Integer.parseInt(dto.getEndmonth());
				for(int i=1;i<12;i++) {
					if(i==endmonth || i==startmonth) {
						
					}
				}
				//int startMonth=Integer.parseInt(dto.getConcertEnd().substring(2)); 
			}
			
			model.addAttribute("list", list);
			model.addAttribute("year", year);
			model.addAttribute("todayYear", todayYear);
			model.addAttribute("today", today);
		} catch (Exception e) {
		}
		
		return "/exhibit/annual/list";
	}
}
