package com.sp.rentfront.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("rentnotice.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertNotice(Notice dto) {
		int result=0;
		
		try {
			int seq=dao.selectOne("rent.seq");
			dto.setRentNum(seq);
			
			result=dao.insertData("rentnotice.InsertNotice", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Notice readBoard(int num) {
		Notice dto=null;
		try {
			dto=dao.selectOne("rentnotice.readNotice", num);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;

		try {
			result=dao.selectOne("rentnotice.dataCount", map);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public int updateNotice(Notice dto) {
		int result=0;
		try {
			result=dao.updateData("rentnotice.updateNotice", dto);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public int deleteNotice(int num) {
		int result=0;
		try {
			result=dao.updateData("rentnotice.deleteNotice", num);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public List<Notice> listExHall(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("rentnotice.listExHall", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public Notice readExHall(int num) {
		Notice dto=null;
		try {
			dto=dao.selectOne("rentnotice.readExHall", num);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public List<Notice> listHall(Map<String, Object> map) {
		List<Notice> list=null;
				
		try {
			list=dao.selectList("rentnotice.listHall", map);
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public Notice readHall(int num) {
		Notice dto=null;
		try {
			dto=dao.selectOne("rentnotice.readHall", num);
		} catch (Exception e) {
		}
		
		return dto;
	}

}
