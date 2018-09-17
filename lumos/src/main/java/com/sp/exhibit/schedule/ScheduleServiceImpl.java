package com.sp.exhibit.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("schedule.scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Schedule> listSchedule(Map<String, Object> map) {
		List<Schedule> list=null;
		
		try {
			list=dao.selectList("exhibitSchedule.listSchedule", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<String> listHall() {
		List<String> list=null;
		
		try {
			list=dao.selectList("exhibitSchedule.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int countSchedule(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("exhibitSchedule.countSchedule", map);			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
