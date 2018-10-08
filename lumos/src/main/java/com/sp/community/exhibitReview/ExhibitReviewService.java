package com.sp.community.exhibitReview;

import java.util.List;
import java.util.Map;

import com.sp.mypage.myactivity.All;

public interface ExhibitReviewService {
	public List<All> eReviewList(Map<String, Object> map);
	public int eDataCount();
	public List<All> eReviewBestList();
	public int eReviewLocationCount(Map<String, Object> map);
	public int insertReviewLike(Map<String, Object> map);
	public int reviewLikeCount(int num);
}
