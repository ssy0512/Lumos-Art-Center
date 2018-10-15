package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("academySales.academyServiceImpl")
public class AcademySalesServiceImpl implements AcademySalesService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("academySales.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return result;
	}

	@Override
	public int dataCount(int academyNum) {
		int result=0;
		
		try {
			result=dao.selectOne("academySales.applyDateCount", academyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public List<AcademySales> listAcademy(Map<String, Object> map) {
		List<AcademySales> list=null;
		
		try {
			list=dao.selectList("academySales.listAcademy", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}				
		return list;
	}

	@Override
	public AcademySales readAcademy(int academyNum) {
		AcademySales dto=null;
		
		try {
			dto=dao.selectOne("academySales.readAcademy", academyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<AcademySales> totalSum(int academytNum) {
		List<AcademySales> list = null;
		try {
			list=dao.selectList("academySales.totalSum", academytNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int totalCount(int academytNum) {
		int result = 0;
		try {
			result=dao.selectOne("academySales.totalCount", academytNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<AcademySales> listOrders(Map<String, Object> map) {
		List<AcademySales> list = null;
		try {
			list = dao.selectList("academySales.listOrders", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
