package com.sp.concert;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("concert.concertSearchService")
public class ConcertSearchServiceImpl implements ConcertSearchService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Concert> listSchedule(Map<String, Object> map) {
		List<Concert> list = null;

		try {
			list = dao.selectList("concert.listSchedule", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	// 공연장 리스트
	@Override
	public List<String> listHall() {
		List<String> list = null;

		try {
			list = dao.selectList("concert.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
