package com.sp.ticketing;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticketing.ticketingService")
public class TicketingServiceImpl implements TicketingService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Ticketing> sessionList(Map<String, Object> map) {
		List<Ticketing> list=null;
		try {
			list=dao.selectList("ticketing.sessionList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
}
