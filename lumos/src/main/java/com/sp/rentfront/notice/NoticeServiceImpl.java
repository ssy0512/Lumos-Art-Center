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
	public int InsertConcert(Notice dto) {
		int result=0;
		
		try {
			result=dao.insertData("rentnotice.InsertConcert", dto);
		} catch (Exception e) {
		}
		return result;
	}
	
	@Override
	public int InsertExhibit(Notice dto) {
		int result=0;
		
		try {
			result=dao.insertData("rentnotice.InsertExhibit", dto);
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

	@Override
	public List<Notice> rentDate(int num) {
		List<Notice> list=null;
		try {
			list=dao.selectOne("rentnotice.rentDate", num);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Notice readRentDate(int concertNum) {
		Notice dto=null;
		try {
			dto=dao.selectOne("rentnotice.readRentDate", concertNum);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public List<Notice> pList(Map<String, Object> map) {
		List<Notice> list=null;
		try {
			list=dao.selectList("rentnotice.pList", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Notice> pList2(Map<String, Object> map) {
		List<Notice> list=null;
		try {
			list=dao.selectList("rentnotice.pList2", map);
		} catch (Exception e) {
		}
		return list;
	}

}
