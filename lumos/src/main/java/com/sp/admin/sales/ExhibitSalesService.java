package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

public interface ExhibitSalesService {
	public int dataCount(Map<String, Object> map);
	public ExhibitSales readExhibitSales(int exhibitNum);
	public List<ExhibitSales> listExhibitSales(Map<String, Object> map);
	public List<ExhibitSales> totalSum(int exhibitNum);
	
	public int totalCount(int exhibitNum);
	public List<ExhibitSales> listOrders(Map<String, Object> map);
	
	public List<String> exhibitPrice(int exhibitNum);
	//public long totalSum(int exhibitNum);
}
