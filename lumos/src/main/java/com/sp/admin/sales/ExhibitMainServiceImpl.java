package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sp.common.dao.CommonDAO;

public class ExhibitMainServiceImpl implements ExhibitMainService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<ExhibitSales> listMain(Map<String, Object> map) {
		List<ExhibitSales> listMain = null;
		try {
			listMain = dao.selectList("exhibitSales.listMain", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return listMain;
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
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("exhibitSales.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
