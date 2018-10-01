package com.sp.community.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("community.event.eventService")
public class EventServiceImpl implements EventService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Event> eventList(Map<String, Object> map) {
		List<Event> list=null;
		try {
			list=dao.selectList("event.eventList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertEvent(Event dto, String pathname) {
		int result=0;
		try {
			int seq=dao.selectOne("event.seq");
			dto.setEventNum(seq);
			
			// 파일 업로드
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.insertData("event.insertEvent", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Event readEvent(int num) {
		Event dto=null;
		try{
			// 게시물 가져오기
			dto=dao.selectOne("event.readEvent", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateEvent(Event dto, String pathname) {
		int result=0;
		
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.updateData("event.updateEvent",dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteEvent(int num, String pathname) {
		int result=0;
		try {
			fileManager.doFileDelete(pathname);
			dao.deleteData("event.deleteEvent",num);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.replyCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("event.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("event.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int endListCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.endListCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Event> endList(Map<String, Object> map) {
		List<Event> list=null;
		try {
			list=dao.selectList("event.endList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int endUpdateEvent(Event dto) {
		int result=0;
		
		try {
			dao.updateData("event.endUpdateEvent",dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int endUserListCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.endUserListCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Event> endUserList(Map<String, Object> map) {
		List<Event> list=null;
		try {
			list=dao.selectList("event.endUserList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
