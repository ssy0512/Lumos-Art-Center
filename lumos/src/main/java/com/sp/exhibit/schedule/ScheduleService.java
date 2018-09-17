package com.sp.exhibit.schedule;

import java.util.List;
import java.util.Map;


public interface ScheduleService {
	public List<Schedule> listSchedule(Map<String, Object> map);
	public List<String> listHall();
	public int countSchedule(Map<String, Object> map);
}
