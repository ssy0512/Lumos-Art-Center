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

	@Override
	public List<Ticketing> timeList(String sessionDate) {
		List<Ticketing> list=null;
		try {
			list=dao.selectList("ticketing.timeList",sessionDate);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Ticketing> seatList(Map<String, Object> map) {
		List<Ticketing> list=null;
		try {
			list=dao.selectList("ticketing.seatList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int seatCount(int sessionNum) {
		int result=0;
		try {
			result=dao.selectOne("ticketing.seatCount",sessionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int selectHallNum(int sessionNum) {
		int result=0;
		try {
			result=dao.selectOne("ticketing.selectHallNum",sessionNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int myMileage(String userId) {
		int result=0;
		try {
			result=dao.selectOne("ticketing.myMileage",userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Ticketing> seatPrice(int hallNum) {
		List<Ticketing> list=null;
		try {
			list=dao.selectList("ticketing.seatPrice",hallNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
}
