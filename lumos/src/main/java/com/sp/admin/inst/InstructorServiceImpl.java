package com.sp.admin.inst;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("instructor.instructorService")
public class InstructorServiceImpl implements InstructorService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	
	@Override
	public int insertInstructor(Instructor dto, String pathname) {
		int result=0;
		try {
			String saveFilename=filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setInstPhotoImage(saveFilename);
				result=dao.insertData("instructor.insertInstructor",dto);
				
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Instructor> listInstructor(Map<String, Object> map) {
		List<Instructor>  list = null;
		 try {
			list=dao.selectList("instructor.listInstructor", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Instructor> listAllInstructor() {
		List<Instructor>  list = null;
		 try {
			list=dao.selectList("instructor.listAllInstructor");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result= dao.selectOne("instructor.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Instructor readInstructor(int instNum) {
		Instructor dto = null;
		try {
			dto= dao.selectOne("instructor.readInstructor", instNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateInstructor(Instructor dto, String pathname) {
		int result= 0 ;
		try {
			String saveFilename = filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				if(dto.getInstPhotoImage().length()!=0) {
					filemanager.doFileDelete(dto.getInstPhotoImage(),pathname);
				}
				dto.setInstPhotoImage(saveFilename);
			}
			result = dao.updateData("instructor.updateInstructor", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result; 
	}

	@Override
	public int deleteInstructor(int instNum, String pathname) {
		int result= 0 ;
		try {
			Instructor dto = readInstructor(instNum);
			if(dto.getInstPhotoImage()!=null)
				filemanager.doFileDelete(dto.getInstPhotoImage(),pathname);
			result = dao.deleteData("instructor.deleteInstructor", instNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
