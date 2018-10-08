package com.sp.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public String getCreatedDate(String userId) {
		String result="";
		try {
			result=dao.selectOne("lumosMypage.getCreatedDate", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int getUsableMileage(String userId) {
		int result=0;
		try {
			result=dao.selectOne("lumosMypage.getUsableMileage", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
