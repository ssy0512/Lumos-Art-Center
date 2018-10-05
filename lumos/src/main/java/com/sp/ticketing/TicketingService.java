package com.sp.ticketing;

import java.util.List;
import java.util.Map;

public interface TicketingService {
	public List<Ticketing> sessionList(Map<String, Object> map);
	public List<Ticketing> timeList(String sessionDate);
	public List<Ticketing> seatList(Map<String, Object> map);
}
