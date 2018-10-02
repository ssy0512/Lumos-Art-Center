package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import com.sp.exhibit.Exhibit;

public interface ExhibitSalesService {
	public int insertExhibitSales(Exhibit dto, String pathname);
	public List<Exhibit> listExhibitSales(Map<String, Object> map);
	public Exhibit readExhibitSales(int num);
	public int dataCount(Map<String, Object> map);
	
/*	public int updateExhibitSales(Exhibit dto);
	public int deleteExhibitSales(Map<String, Object> map);
	public Exhibit readExHall(int num);
	public List<String> exhibitPrice(int num);*/
}
