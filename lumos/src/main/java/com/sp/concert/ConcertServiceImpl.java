package com.sp.concert;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("concert.concertService")
public class ConcertServiceImpl implements ConcertService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Concert readBoard(int num) {
		Concert dto=null;
		try{
			// 게시물 가져오기
			dto=dao.selectOne("concert.readConcert", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Concert dto) {
		int result=0;

		try{
			dao.updateData("concert.updateConcert", dto);
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
			result=dao.insertData("concert.insertBoardLike", map);
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
			result=dao.insertData("concert.deleteBoardLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countBoardLike(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("concert.countBoardLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Concert> listConcertHall() {
		List<Concert> list = null;
		try {
			list=dao.selectList("concert.listConcertHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Concert readConcertHall(int num) {
		Concert dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("concert.readConcertHall", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public List<Concert> seatList(int num) {
		List<Concert> list = null;
		try {
			list=dao.selectList("concert.seatList",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertList(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("concert.updateSeatPrice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
			return result;
		}
		return result;
	}

	@Override
	public int updateConcertHall(Concert dto) {
		int result=0;

		try{
			dao.updateData("concert.updateConcertHall", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
