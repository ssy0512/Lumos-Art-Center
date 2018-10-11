package com.sp.ticketing;

import java.util.List;
import java.util.Map;

public interface TicketingService {
	public List<Ticketing> sessionList(Map<String, Object> map);
	public List<Ticketing> timeList(String sessionDate);
	public List<Ticketing> seatList(Map<String, Object> map);
	public int seatCount(int sessionNum);
	public int selectHallNum(int sessionNum);
	
	public List<Ticketing> seatPrice(int hallNum);
	public int myMileage(String userId);
	public List<Ticketing> sessionDate(int sessionNum);
}
