package com.sp.admin.exh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("exh.exscheduleController")
public class ExScheduleController {
	@Autowired
	private ExhibitService service;
	
	@RequestMapping(value="/admin/menu2/exhibitSchedule/main")
	public String main() {
		return ".admin4.menu2.exhibitSchedule.main";
	}//전시메인

	@RequestMapping(value="/admin/menu2/exhibitSchedule/resources")
	@ResponseBody
	public List<ExhibitJSON> resources(HttpServletResponse resp)throws Exception{
		List<ExhibitJSON> list=service.listHall();
		return list;
	}
	@RequestMapping(value="/admin/menu2/exhibitSchedule/events")
	@ResponseBody
	public List<ExhibitJSON> events(
			@RequestParam String start,
			@RequestParam String end
			) throws Exception{
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<ExhibitJSON> list=service.listScheduler(map);
		return list;
	}
	@RequestMapping(value="/admin/menu2/exhibitSchedule/inputForm")
	public String inputForm(Model model) throws Exception{
		List<ExhibitSch> locationList=service.listlocation();
		model.addAttribute("locationList",locationList);
		return "admin/menu2/exhibitSchedule/inputForm";
	}
	@RequestMapping(value="/admin/menu2/exhibitSchedule/readHallList")
	@ResponseBody
	public Map<String, Object> readHallList(int hallNum)throws Exception{
		ExhibitSch es=service.readHall(hallNum);
		Map<String, Object> model=new HashMap<>();
		String state="true";
		if(es==null) {
			state="false";
		}else {
			model.put("es", es);
		}
		model.put("state", state);
		return model;
	}
}
