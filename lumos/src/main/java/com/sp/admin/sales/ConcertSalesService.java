package com.sp.admin.sales;

import java.util.List;
import java.util.Map;

import com.sp.concert.Concert;

public interface ConcertSalesService {
	public int dataCount(Map<String, Object> map);
	public ConcertSales readConcertSales(int concertNum);
	public List<ConcertSales> listConcertSales(Map<String, Object> map);
	public List<Concert> seatList(int concertNum);
	public List<ConcertSales> totalSum(int concertNum);
	
	public int totalCount(int concertNum);
	public List<ConcertSales> listOrders(Map<String, Object> map);
	
	//public long totalSum();
}
