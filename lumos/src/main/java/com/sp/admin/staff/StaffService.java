package com.sp.admin.staff;

import java.util.List;
import java.util.Map;

public interface StaffService {
	
	public int insertStaff(Staff dto, String pathname);
	public List<Staff> listStaff(Map<String, Object> map);
	
	public int dataCount(Map<String, Object> map);
	public Staff readStaff(int staffNum);

	public int updateStaff(Staff dto, String pathname);
	public int deleteStaff(int staffNum, String pathname);
	
	
}
