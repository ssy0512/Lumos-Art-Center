package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

public interface ExhibitSalesService {
	public List<ExhibitSales> listExhibitSales(Map<String, Object> map);
	public ExhibitSales readExhibitSales(int exhibitNum);
	public int dataCount(Map<String, Object> map);
	
/*	public int updateExhibitSales(Exhibit dto);
	public int insertExhibitSales(ExhibitSales dto, String pathname);
	public int deleteExhibitSales(Map<String, Object> map);
	public Exhibit readExHall(int num);
	public List<String> exhibitPrice(int num);*/
}
