package com.sp.admin.scheduler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;
//일정 메인
@Controller("scheduler.scheduleController")
public class ConcScheduleController {
	@Autowired
	private ConcertService service;
	
	@RequestMapping(value="/admin/menu2/concertSchedule/main", method=RequestMethod.GET) //일정관리의 메인
	public String main() {
		return ".admin4.menu2.concertSchedule.main";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/resources") //재확인할것. 
	@ResponseBody
	public List<ConcertSchJSON> halls(HttpServletResponse resp) throws Exception{
		List<ConcertSchJSON> list=service.listHall();
		return list;
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/events")
	@ResponseBody
	public List<ConcertSchJSON> events(
			@RequestParam String start,
			@RequestParam String end
			) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<ConcertSchJSON> list=service.listScheduler(map);
		return list;
	}

	@RequestMapping(value="/admin/menu2/concertSchedule/inputForm")
	public String inputForm(Model model) throws Exception {
		List<ConcertSch> locationList=service.listlocation();
		
		model.addAttribute("locationList", locationList);
		return "admin/menu2/concertSchedule/inputForm";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/readHall")
	@ResponseBody
	public Map<String, Object> readHall(int hallNum) throws Exception {
		ConcertSch cs=service.readHall(hallNum);
		
		Map<String, Object> model=new HashMap<>();
		String state="true";
		if(cs==null) {
			state="false";
		} else {
			model.put("cs", cs);
		}
		
		model.put("state", state);
		return model;
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/listHall")
	@ResponseBody
	public Map<String, Object> listHall(int locationNum) throws Exception {
		List<ConcertSch> list=service.listHall(locationNum);
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	@RequestMapping(value="/admin/menu2/concertSchedule/schedulerInsert")
	@ResponseBody
	public Map<String, Object> schedulerInsert(ConcertSch cs,
			HttpSession session
			) throws Exception {
		String state="true";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		cs.setUserId(info.getUserId());
		
		service.insertScheduler(cs);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/articleForm")
	public String articleForm(Model model) throws Exception {
		return "admin/menu2/concertSchedule/articleForm";
	}
	
	@RequestMapping(value="/admin/menu2/concertSchedule/schedulerUpdate")
	@ResponseBody
	public Map<String, Object> schedulerUpdate(ConcertSch cs,
			HttpSession session
			) throws Exception {
		String state="true";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		cs.setUserId(info.getUserId());
		
		int result=service.updateScheduler(cs);
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/admin/menu2/concertSchedule/schedulerDelete")
	@ResponseBody
	public Map<String, Object> schedulerDelete(int concertNum,
			HttpSession session
			) throws Exception {
		String state="true";
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("concertNum", concertNum);
		
		int result=service.deleteScheduler(map);
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
}
