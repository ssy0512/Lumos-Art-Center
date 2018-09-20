package com.sp.academy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("Academy.academyServiceImpl")
public class AcademyServiceImpl implements AcademyService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("academy.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return result;
	}

	@Override
	public int dataCount(int academyNum) {
		int result=0;
		
		try {
			result=dao.selectOne("academy.applyDateCount", academyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public List<Academy> listAcademy(Map<String, Object> map) {
		List<Academy> list=null;
		
		try {
			list=dao.selectList("academy.listAcademy", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}				
		return list;
	}

	@Override
	public Academy readAcademy(int academyNum) {
		Academy dto=null;
		
		try {
			dto=dao.selectOne("academy.readAcademy", academyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Academy preReadAcademy(Map<String, Object> map) {
		Academy dto=null;
		
		try {
			dto=dao.selectOne("academy.preReadAcademy", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Academy nextReadAcademy(Map<String, Object> map) {
		Academy dto=null;
		
		try {
			dto=dao.selectOne("academy.nextReadAcademy", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateInfo(Academy dto, String pathname) {
		int result=0;
		
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.updateData("academy.updateInfo", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
