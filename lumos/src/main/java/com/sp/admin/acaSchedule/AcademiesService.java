package com.sp.admin.acaSchedule;

import java.util.List;
import java.util.Map;

public interface AcademiesService { //공연등록인터페이스 basic informations
	
	public List<Academies> listRoom();
	public List<Academies> listInst();
	
	public int insertAcademies(Academies dto,String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Academies> listAcademies(Map<String, Object> map);
	public Academies readAcademies(int academyNum);
	
	public int updateAcademies(Academies dto, String pathname);
	public int deleteAcademies(int academyNum,String pathname);
	
	
	
	
}
