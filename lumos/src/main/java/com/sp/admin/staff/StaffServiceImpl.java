package com.sp.admin.staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("staff.staffService")
public class StaffServiceImpl implements StaffService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager filemanager;
	
	
	@Override
	public int insertStaff(Staff dto, String pathname) {
		int result = 0;
		try {
			String saveFilename= filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setStaffImage(saveFilename);
				result= dao.insertData("staff.insertStaff", dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Staff> listStaff(Map<String, Object> map) {
		 List<Staff>  list = null;
		 try {
			list=dao.selectList("staff.listStaff", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Staff> listAllStaff() {
		 List<Staff>  list = null;
		 try {
			list=dao.selectList("staff.listAllStaff");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result= dao.selectOne("staff.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Staff readStaff(int staffNum) {
		Staff dto = null;
		try {
			dto= dao.selectOne("staff.readStaff", staffNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateStaff(Staff dto, String pathname) {
		int result= 0 ;
		try {
			String saveFilename = filemanager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				if(dto.getStaffImage().length()!=0) {
					filemanager.doFileDelete(dto.getStaffImage(),pathname);
				}
				dto.setStaffImage(saveFilename);
			}
			result = dao.updateData("staff.updateStaff", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result; 
	}

	@Override
	public int deleteStaff(int staffNum, String pathname) {
		int result= 0 ;
		try {
			Staff dto = readStaff(staffNum);
			if(dto.getStaffImage()!=null)
				filemanager.doFileDelete(dto.getStaffImage(),pathname);
			result = dao.deleteData("staff.deleteStaff", staffNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
