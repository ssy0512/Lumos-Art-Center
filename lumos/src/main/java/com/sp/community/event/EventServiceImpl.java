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
	public Event readBoard(int num) {
		Event dto=null;
		try{
			// 게시물 가져오기
			dto=dao.selectOne("event.readEvent", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
}
