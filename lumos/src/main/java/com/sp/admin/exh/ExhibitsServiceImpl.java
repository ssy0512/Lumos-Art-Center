package com.sp.admin.exh;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("exhibits.exhibitsService")
public class ExhibitsServiceImpl implements ExhibitsService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	@Override
	
	public List<Exhibits> listHall() {
		List<Exhibits> list=null;
		try {
			list=dao.selectList("exhibits.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Exhibits> listRate() {
		List<Exhibits> list=null;
		try {
			list=dao.selectList("exhibits.listRate");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	
	@Override
	public int insertExhibits(Exhibits dto, String pathname) {
		int result=0;
		try {
			
			
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setExProfileImage(saveFilename);
				result = dao.insertData("exhibits.insertExhibits", dto);
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
			result=dao.selectOne("exhibits.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Exhibits> listExhibits(Map<String, Object> map) {
		List<Exhibits> list = null;
		
		try {
			list = dao.selectList("exhibits.listExhibits", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Exhibits readExhibits(int exhibitNum) {
		Exhibits dto = null;
		
		try {
			dto=dao.selectOne("exhibits.readExhibits", exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateExhibits(Exhibits dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				if(dto.getExProfileImage().length()!=0) {
					filemanager.doFileDelete(dto.getExProfileImage(),pathname);
				}
				dto.setExProfileImage(saveFilename);
			}
			result=dao.updateData("exhibits.updateExhibits",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

	@Override
	public int deleteExhibits(int exhibitNum,String pathname) {
		int result=0;
		try {
			Exhibits dto=readExhibits(exhibitNum);
			if(dto.getExProfileImage()!=null)
				filemanager.doFileDelete(dto.getExProfileImage(),pathname);
			result=dao.deleteData("exhibits.deleteExhibits",exhibitNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

}
