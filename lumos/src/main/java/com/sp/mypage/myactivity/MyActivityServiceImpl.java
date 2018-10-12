package com.sp.mypage.myactivity;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mypage.myActivityService")
public class MyActivityServiceImpl implements MyActivityService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<All> alleReviewList(String userId) {
		List<All> list = null;
		try {
			list=dao.selectList("lumosMypage.alleReviewList", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<All> allcReviewList(String userId) {
		List<All> list = null;
		try {
			list=dao.selectList("lumosMypage.allcReviewList", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<All> allmyQnaList(String userId) {
		List<All> list = null;
		try {
			list=dao.selectList("lumosMypage.allmyQnaList", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<All> cReviewList(Map<String, Object> map) {
		List<All> list = null;
		try {
			list=dao.selectList("lumosMypage.cReviewList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int cDataCount(String userId) {
		int result = 0;
		try {
			result=dao.selectOne("lumosMypage.cDataCount", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<All> eReviewList(Map<String, Object> map) {
		List<All> list = null;
		try {
			list=dao.selectList("lumosMypage.eReviewList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int eDataCount(String userId) {
		int result = 0;
		try {
			result=dao.selectOne("lumosMypage.eDataCount", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteEReview(int num) {
		int result=0;

		try{
			dao.deleteData("lumosMypage.deleteEReview", num);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int deleteCReview(int num) {
		int result=0;

		try{
			dao.deleteData("lumosMypage.deleteCReview", num);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
