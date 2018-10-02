package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.exhibit.Exhibit;

@Service ("exhibitSales.exhibitSalesService")
public class ExhibitSalesServiceImpl implements ExhibitSalesService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertExhibitSales(Exhibit dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("exhibitSales.insertExhibitSales", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Exhibit> listExhibitSales(Map<String, Object> map) {
		List<Exhibit> list = null;
		try {
			list = dao.selectList("exhibit.listExhibitSales", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Exhibit readExhibitSales(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
