package com.sp.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	
	public int insertNotice(Notice dto);
	
	public int dataCount(Map<String, Object> map);
	
	public List<Notice> listNotice(Map<String, Object> map);
	
	public List<Notice> listNoticeTop();
	
	public int updateHitCount(int noticeNum);
	
	public Notice readNotice(int noticeNum);
	
	public Notice preReadNotice(Map<String, Object> map);
	
	public Notice nextReadNotice(Map<String, Object> map);
	
	public int updateNotice(Notice dto);
	
	public int deleteNotice(int noticeNum);
	

}
