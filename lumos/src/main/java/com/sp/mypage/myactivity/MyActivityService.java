package com.sp.mypage.myactivity;

import java.util.List;
import java.util.Map;


public interface MyActivityService {
	public List<All> alleReviewList(String userId);
	public List<All> allcReviewList(String userId);
	public List<All> allmyQnaList(String userId);
	public List<All> cReviewList(Map<String, Object> map);
	
	public int cDataCount(String userId);
}
