package com.sp.exhibit;

import java.sql.SQLIntegrityConstraintViolationException;
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
		} catch (SQLIntegrityConstraintViolationException e) {
			result = deleteBoardLike(map);
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
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
}
