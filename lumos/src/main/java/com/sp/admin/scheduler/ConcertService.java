package com.sp.admin.scheduler;

import java.util.List;
import java.util.Map;

public interface ConcertService { //공연인터페이스
	public int insertlocation(ConcertSch cs);//없어도 되는거 아닌가?....
	public int updatelocation(ConcertSch cs);
	public int deletelocation(int locationNum);
	public ConcertSch readlocation(int locationNum);
	public List<ConcertSch> listlocation();
	
	public int insertHall(ConcertSch cs);
	public int updateHall(ConcertSch cs);
	public int deleteHall(int hallNum);
	public ConcertSch readHall(int hallNum);
	public List<ConcertSchJSON> listHall();
	public List<ConcertSch> listHall(int locationNum);
	
	public int insertScheduler(ConcertSch cs);
	public int updateScheduler(ConcertSch cs);
	public int deleteScheduler(Map<String, Object> map);
	public ConcertSch readScheduler(int concertNum);
	public List<ConcertSchJSON> listScheduler(Map<String, Object> map);
	
	
}
