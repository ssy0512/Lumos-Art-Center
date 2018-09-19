package com.sp.academy;

import java.util.List;
import java.util.Map;

public interface AcademyService {
	public int dataCount(Map<String, Object> map); 
	public List<Academy> listAcademy(Map<String, Object> map);
	public Academy readAcademy(int num);
	public Academy preReadAcademy(Map<String, Object> map);
	public Academy nextReadAcademy(Map<String, Object> map);
	public int updateInfo(Academy dto, String pathname);
	
}
