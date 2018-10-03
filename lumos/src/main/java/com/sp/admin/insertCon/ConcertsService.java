package com.sp.admin.insertCon;

import java.util.List;
import java.util.Map;

public interface ConcertsService { //공연등록인터페이스 basic informations
	
	public List<Concerts> listHall();
	public List<Concerts> listRate();
	public List<Concerts> listLevel(); 
	
	public int insertConcert(Concerts dto,String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Concerts> listConcerts(Map<String, Object> map);
	public Concerts readConcertList(int concertNum);
	
	public int updateConcerts(Concerts dto, String pathname);
	public int updateSeatPrice(Concerts dto);
	public int updateSession(Concerts dto);
	
	public int deleteConcerts(int concertNum,String pathname);
	
	
	
	
}
