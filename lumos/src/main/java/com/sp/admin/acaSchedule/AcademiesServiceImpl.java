package com.sp.admin.acaSchedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("academies.academiesService")
public class AcademiesServiceImpl implements AcademiesService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	@Override
	
	public List<Academies> listRoom() {
		List<Academies> list=null;
		try {
			list=dao.selectList("academies.listRoom");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Academies> listInst() {
		List<Academies> list=null;
		try {
			list=dao.selectList("academies.listInst");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	
	@Override
	public int insertAcademies(Academies dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setAcProfileImage(saveFilename);
				result = dao.insertData("academies.insertAcademies", dto);
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
			result=dao.selectOne("academies.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Academies> listAcademies(Map<String, Object> map) {
		List<Academies> list = null;
		
		try {
			list = dao.selectList("academies.listAcademies", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Academies readAcademies(int academyNum) {
		Academies dto = null;
		
		try {
			dto=dao.selectOne("academies.readAcademies", academyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateAcademies(Academies dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				if(dto.getAcProfileImage().length()!=0) {
					filemanager.doFileDelete(dto.getAcProfileImage(),pathname);
				}
				dto.setAcProfileImage(saveFilename);
			}
			result=dao.updateData("academies.updateAcademies",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

	@Override
	public int deleteAcademies(int academyNum,String pathname) {
		int result=0;
		try {
			Academies dto=readAcademies(academyNum);
			if(dto.getAcProfileImage()!=null)
				filemanager.doFileDelete(dto.getAcProfileImage(),pathname);
			result=dao.deleteData("academies.deleteAcademies",academyNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	

}
