package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

public interface ExhibitMainService {
	public List<ExhibitSales> listMain(Map<String, Object> map);
	public ExhibitSales readExhibitSales(int exhibitNum);
	public int dataCount(Map<String, Object> map);
}
