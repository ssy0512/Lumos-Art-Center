package com.sp.admin.insertCon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("concerts.concertService")
public class ConcertsServiceImpl implements ConcertsService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	@Override
	
	public List<Concerts> listHall() {
		List<Concerts> list=null;
		try {
			list=dao.selectList("concerts.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Concerts> listRate() {
		List<Concerts> list=null;
		try {
			list=dao.selectList("concerts.listRate");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Concerts> listLevel() {
		List<Concerts> list=null;
		try {
			list=dao.selectList("concerts.listLevel");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int insertConcert(Concerts dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setConProfileImage(saveFilename);
				result = dao.insertData("concerts.insertConcert", dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("concerts.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Concerts> listConcerts(Map<String, Object> map) {
		List<Concerts> list = null;
		
		try {
			list = dao.selectList("concerts.listConcerts", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Concerts readConcertList(int concertNum) {
		Concerts dto = null;
		
		try {
			dto=dao.selectOne("concerts.readConcertList", concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateConcerts(Concerts dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				if(dto.getConProfileImage().length()!=0) {
					filemanager.doFileDelete(dto.getConProfileImage(),pathname);
				}
				dto.setConProfileImage(saveFilename);
			}
			result=dao.updateData("concerts.updateConcerts",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

	@Override
	public int deleteConcerts(int concertNum,String pathname) {
		int result=0;
		try {
			Concerts dto=readConcertList(concertNum);
			if(dto.getConProfileImage()!=null)
				filemanager.doFileDelete(dto.getConProfileImage(),pathname);
			result=dao.deleteData("question.deleteQuestion",concertNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

}
