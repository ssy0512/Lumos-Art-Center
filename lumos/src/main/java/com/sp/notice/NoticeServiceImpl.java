package com.sp.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("customerCenter.NoticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private CommonDAO dao;
	

	@Override
	public int insertNotice(Notice dto) {
		int result = 0 ; 
		try {
	
			result = dao.insertData("notice.insertNotice", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0; 
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
			
		try {
			list=dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		try {
			list=dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateHitCount(int noticeNum) {
		int result =0;
		
		try {
			result =dao.updateData("notice.updateHitCount", noticeNum);
			
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Notice readNotice(int noticeNum) {
		Notice dto = null;
		
		try {
			dto=dao.selectOne("notice.readNotice", noticeNum);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto=dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto=dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto) {
		int result =0;
		
		try {
			result=dao.updateData("notice.updateNotice", dto);
		} catch (Exception e) {		
		}
		return result;
	}

	@Override
	public int deleteNotice(int noticeNum) {
		int result = 0;
		
		try {
			result=dao.deleteData("notice.deleteNotice",noticeNum);
		} catch (Exception e) {
		}
		return result;
	}

	
	

}
