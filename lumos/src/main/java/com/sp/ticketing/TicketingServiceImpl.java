package com.sp.ticketing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticketing.ticketingService")
public class TicketingServiceImpl implements TicketingService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Ticketing> sessionList(int concertNum) {
		List<Ticketing> list=null;
		try {
			list=dao.selectList("ticketing.sessionList",concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
}
