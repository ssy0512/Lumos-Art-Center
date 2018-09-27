package com.sp.community.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public List<Event> eventList(Map<String, Object> map);
	public int insertEvent(Event dto, String pathname);
	
	public int insertFile(Event dto);
	public List<Event> listFile(int num);
	public Event readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
