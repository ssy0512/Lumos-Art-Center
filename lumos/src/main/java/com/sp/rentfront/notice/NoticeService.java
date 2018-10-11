package com.sp.rentfront.notice;

import java.util.List;
import java.util.Map;


public interface NoticeService {
	public int InsertConcert(Notice dto);
	public int InsertExhibit(Notice dto);
	public Notice readBoard(int num);
	public int dataCount(Map<String, Object> map);
	public int updateNotice(Notice dto);
	public int deleteNotice(int num);
	
	public List<Notice> pList(Map<String, Object> map);
	public List<Notice> pList2(Map<String, Object> map);
	
	public List<Notice> listExHall(Map<String, Object> map);
	public Notice readExHall(int num);
	
	public List<Notice> listHall(Map<String, Object> map);
	public Notice readHall(int num);
	
	public List<Notice> rentDate(int num);
	public Notice readRentDate(int num);
}
