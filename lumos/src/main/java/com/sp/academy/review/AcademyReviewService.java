package com.sp.academy.review;

import java.util.List;
import java.util.Map;

import com.sp.academy.Academy;

public interface AcademyReviewService {
	public int insertReview(AcademyReview dto);
	public List<AcademyReview> listReview(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int updateHitCount(int num);
	public AcademyReview readReview(int num);
	public AcademyReview preReview(Map<String, Object> map);
	public AcademyReview nextReview(Map<String, Object> map);
	public int updateReview(AcademyReview dto);
	public int deleteReview(int num, String userId);
	public List<Academy> sbList(Map<String, Object> map); 
	
	public int insertReviewLike(Map<String, Object> map);
	public int reviewLikeCount(int num);
	
}
