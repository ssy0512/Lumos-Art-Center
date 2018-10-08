package com.sp.mypage.myactivity;

import java.util.List;
import java.util.Map;


public interface MyActivityService {
	public List<All> alleReviewList(String userId);
	public List<All> allcReviewList(String userId);
	public List<All> allmyQnaList(String userId);
	public List<All> cReviewList(Map<String, Object> map);
	public int cDataCount(String userId);
	public List<All> eReviewList(Map<String, Object> map);
	public int eDataCount(String userId);
	public int deleteEReview(int num);
}
