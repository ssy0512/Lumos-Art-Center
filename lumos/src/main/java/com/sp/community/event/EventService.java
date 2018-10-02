package com.sp.community.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public List<Event> eventList(Map<String, Object> map);
	public int insertEvent(Event dto, String pathname);
	public Event readEvent(int num);
	public int updateEvent(Event dto, String pathname);
	public int deleteEvent(int num, String pathname);
	
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public int insertReply(Reply dto);
	public int deleteReply(Map<String, Object> map);
	
	public int endListCount(Map<String, Object> map);
	public int endUserListCount(Map<String, Object> map);
	public List<Event> endList(Map<String, Object> map);
	public List<Event> endUserList(Map<String, Object> map);
	public int endUpdateEvent(Event dto);
	
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
}
