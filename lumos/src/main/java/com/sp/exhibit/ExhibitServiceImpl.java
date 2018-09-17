package com.sp.exhibit;

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
}
