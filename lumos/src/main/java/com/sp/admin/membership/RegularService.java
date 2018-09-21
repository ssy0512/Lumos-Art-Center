package com.sp.admin.membership;

import java.util.List;
import java.util.Map;

public interface RegularService {
	public int insertRegular(Regular dto, String pathname);
	public List<Regular> listRegular(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public Regular readRegular(int memberIndex);
	
	public int updateRegular(Regular dto);
}
