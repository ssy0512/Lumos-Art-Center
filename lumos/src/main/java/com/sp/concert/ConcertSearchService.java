package com.sp.concert;

import java.util.List;
import java.util.Map;

public interface ConcertSearchService {
	public List<Concert> listSchedule(Map<String, Object> map);
	public List<String> listHall();
}
