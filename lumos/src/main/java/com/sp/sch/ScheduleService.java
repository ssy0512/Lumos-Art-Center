package com.sp.sch;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	public List<Schedule> listMonth(Map<String, Object> map) throws Exception;
	public List<Schedule> listYear(Map<String, Object> map) throws Exception;
}
