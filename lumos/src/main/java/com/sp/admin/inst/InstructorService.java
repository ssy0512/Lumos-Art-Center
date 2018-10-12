package com.sp.admin.inst;

import java.util.List;
import java.util.Map;

public interface InstructorService {
	
	public int insertInstructor(Instructor dto, String pathname);
	public List<Instructor> listInstructor(Map<String, Object> map);
	public List<Instructor> listAllInstructor();
	
	public int dataCount(Map<String, Object> map);
	public Instructor readInstructor(int instNum);

	public int updateInstructor(Instructor dto, String pathname);
	public int deleteInstructor(int instNum, String pathname);
	
	
}
