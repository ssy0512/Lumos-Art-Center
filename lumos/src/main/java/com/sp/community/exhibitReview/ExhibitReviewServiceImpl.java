package com.sp.community.exhibitReview;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.mypage.myactivity.All;

@Service("community.exhibitReviewService")
public class ExhibitReviewServiceImpl implements ExhibitReviewService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<All> eReviewList(Map<String, Object> map) {
		List<All> list = null;
		try {
			list=dao.selectList("review.eReviewList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int eDataCount() {
		int result = 0;
		try {
			result=dao.selectOne("review.eDataCount");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<All> eReviewBestList() {
		List<All> list = null;
		try {
			list=dao.selectList("review.eReviewBestList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int eReviewLocationCount(Map<String, Object> map) {
		int result = 0;
		try {
			result=dao.selectOne("review.eReviewLocationCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReviewLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("review.insertReviewLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int reviewLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("review.reviewLikeCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
