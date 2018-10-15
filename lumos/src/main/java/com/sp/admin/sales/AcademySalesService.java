package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

public interface AcademySalesService {
	public int dataCount(Map<String, Object> map); 
	public int dataCount(int num);
	public List<AcademySales> listAcademy(Map<String, Object> map);
	public AcademySales readAcademy(int num);
	
	public List<AcademySales> totalSum(int academytNum);
	public int totalCount(int academytNum);
	public List<AcademySales> listOrders(Map<String, Object> map);
}
