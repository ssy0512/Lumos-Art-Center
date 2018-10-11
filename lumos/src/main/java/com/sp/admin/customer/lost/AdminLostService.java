package com.sp.admin.customer.lost;

import java.util.List;
import java.util.Map;

public interface AdminLostService {
	
	public void insertLost(Lost dto) throws Exception;
	public List<Lost> listLost(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Lost readLost(int lostNum);
	public void updateLostStatus(Lost dto) throws Exception;
	

}
