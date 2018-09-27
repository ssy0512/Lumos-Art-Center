package com.sp.academy.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.academy.Academy;
import com.sp.common.dao.CommonDAO;

@Service("academyreview.AcademyReviewService")
public class AcademyReviewServiceImpl implements AcademyReviewService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertReview(AcademyReview dto) {
		int result=0;
		
		try {
			result=dao.insertData("academyReview.insertReview",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<AcademyReview> listReview(Map<String, Object> map) {
		List<AcademyReview> list=null;
		
		try {
			list=dao.selectList("academyReview.listReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("academyReview.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("academyReview.updateHitCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public AcademyReview readReview(int num) {
		AcademyReview dto=null;
		try {
			dto=dao.selectOne("academyReview.readReview", num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public AcademyReview preReview(Map<String, Object> map) {
		AcademyReview dto=null;
		try {
			dto=dao.selectOne("academyReview.preReview",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public AcademyReview nextReview(Map<String, Object> map) {
		AcademyReview dto=null;
		try {
			dto=dao.selectOne("academyReview.nextReview",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateReview(AcademyReview dto) {
		int result=0;
		try {
			result=dao.updateData("academyReview.updateReview", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReview(int num, String userId) {
		int result=0;
		try {
			AcademyReview dto=readReview(num);
			if(dto==null||(! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return result;
			
			dao.deleteData("academyReview.deleteReview", num);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReviewLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("academyReview.insertReviewLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int reviewLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("academyReview.reviewLikeCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Academy> sbList(Map<String, Object> map) {
		List<Academy> list=null;
		
		try {
			list=dao.selectList("academyReview.sbList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
