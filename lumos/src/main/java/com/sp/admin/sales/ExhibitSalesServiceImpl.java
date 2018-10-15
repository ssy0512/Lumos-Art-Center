package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service ("exhibitSales.exhibitSalesService")
public class ExhibitSalesServiceImpl implements ExhibitSalesService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<ExhibitSales> listExhibitSales(Map<String, Object> map) {
		List<ExhibitSales> list = null;
		try {
			list = dao.selectList("exhibitSales.listExhibitSales", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("exhibitSales.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ExhibitSales readExhibitSales(int exhibitNum) {
		ExhibitSales dto = null;
		try {
			dto=dao.selectOne("exhibitSales.readExhibitSales", exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public List<String> exhibitPrice(int exhibitNum) {
		List<String> list = null;
		try {
			list=dao.selectList("exhibitSales.exhibitPrice",exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

/*	@Override
	public long totalSum(int exhibitNum) {
		long result=0;
		try {
			result=dao.selectOne("exhibitSales.totalSum");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}*/
	
	@Override
	public List<ExhibitSales> totalSum(int exhibitNum) {
		List<ExhibitSales> list = null;
		try {
			list=dao.selectList("exhibitSales.totalSum", exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int totalCount(int exhibitNum) {
		int result = 0;
		try {
			result=dao.selectOne("exhibitSales.totalCount", exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<ExhibitSales> listOrders(Map<String, Object> map) {
		List<ExhibitSales> list = null;
		try {
			list = dao.selectList("exhibitSales.listOrders", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
