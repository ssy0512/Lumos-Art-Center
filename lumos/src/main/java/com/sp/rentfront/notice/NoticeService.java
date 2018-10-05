package com.sp.rentfront.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto);
	public Notice readBoard(int num);
	public int dataCount(Map<String, Object> map);
	public int updateNotice(Notice dto);
	public int deleteNotice(int num);
	
	public List<Notice> listExHall(Map<String, Object> map);
	public Notice readExHall(int num);
	
	public List<Notice> listHall(Map<String, Object> map);
	public Notice readHall(int num);
}
