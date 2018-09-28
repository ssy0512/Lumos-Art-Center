package com.sp.community.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public List<Event> eventList(Map<String, Object> map);
	public int insertEvent(Event dto, String pathname);
	public Event readBoard(int num);
	
	public Event readUpdateBoard(int num);
	public int updateBoard(Event dto, String pathname);
}
