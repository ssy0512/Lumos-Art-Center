package com.sp.sch;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("sch.scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Schedule> listMonth(Map<String, Object> map) throws Exception{
		List<Schedule> list=null;
		try {
			list=dao.selectList("sch.listConcertMonth", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Schedule> listYear(Map<String, Object> map) throws Exception{
		List<Schedule> list=null;
		try {
			list=dao.selectList("sch.listYear", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
