package com.sp.exhibit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("exhibit.exhibitService")
public class ExhibitServiceImpl implements ExhibitService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Exhibit readBoard(int num) {
		Exhibit dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("exhibit.readExhibit", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int updateBoard(Exhibit dto) {
		int result=0;

		try{
			dao.updateData("exhibit.updateExhibit", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertBoardLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("exhibit.insertBoardLike", map);
		} catch (Exception e) {
			result = deleteBoardLike(map);
			System.out.println(e.toString());
			return result;
		}
		return result;
	}
	
	@Override
	public int deleteBoardLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("exhibit.deleteBoardLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countBoardLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("exhibit.countBoardLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Exhibit> listExHall() {
		List<Exhibit> list = null;
		try {
			list=dao.selectList("exhibit.listExHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Exhibit readExHall(int num) {
		Exhibit dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("exhibit.readExHall", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int updateExHall(Exhibit dto) {
		int result=0;

		try{
			dao.updateData("exhibit.updateExHall", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<String> exhibitPrice(int num) {
		List<String> list = null;
		try {
			list=dao.selectList("exhibit.exhibitPrice",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public ExReview readExReviewForUpdate(Map<String, Object> map) {
		ExReview dto = null;
		try {
			dto = dao.selectOne("exhibit.readExReviewForUpdate", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateExReview(ExReview dto) {
		int result=0;

		try{
			dao.updateData("exhibit.updateExReview", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertExReview(ExReview dto) {
		int result=0;

		try{
			dao.updateData("exhibit.insertExReview", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Exhibit> audienceList(int num) {
		List<Exhibit> list = null;
		try {
			list=dao.selectList("exhibit.audienceList",num);
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getUsableMileage(String userId) {
		int result=0;
		try {
			result=dao.selectOne("exhibit.getUsableMileage",userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
