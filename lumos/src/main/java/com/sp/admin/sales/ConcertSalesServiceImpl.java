package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.concert.Concert;

@Service ("concertSales.concertSalesService")
public class ConcertSalesServiceImpl implements ConcertSalesService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("concertSales.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ConcertSales readConcertSales(int concertNum) {
		ConcertSales dto = null;
		try {
			dto=dao.selectOne("concertSales.readConcertSales", concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<ConcertSales> listConcertSales(Map<String, Object> map) {
		List<ConcertSales> list = null;
		try {
			list = dao.selectList("concertSales.listConcertSales", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Concert> seatList(int concertNum) {
		List<Concert> list = null;
		try {
			list=dao.selectList("concertSales.seatList", concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<ConcertSales> totalSum(int concertNum) {
		List<ConcertSales> list = null;
		try {
			list=dao.selectList("concertSales.totalSum",concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int totalCount(int concertNum) {
		int result=0;
		try {
			result=dao.selectOne("concertSales.totalCount", concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<ConcertSales> listOrders(Map<String, Object> map) {
		List<ConcertSales> list = null;
		try {
			list = dao.selectList("concertSales.listOrders", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	
	/*@Override
	public long totalSum() {
		long result=0;
		try {
			result=dao.selectOne("concertSales.totalSum");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}*/
}
