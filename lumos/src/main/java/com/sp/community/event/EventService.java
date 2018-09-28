package com.sp.community.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public List<Event> eventList(Map<String, Object> map);
	public int insertEvent(Event dto, String pathname);
	public Event readEvent(int num);
	public int updateEvent(Event dto, String pathname);
	public int deleteEvent(int num, String pathname);
}
