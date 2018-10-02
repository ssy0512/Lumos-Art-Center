package com.sp.admin.exh;

import java.util.List;
import java.util.Map;

public interface ExhibitsService { //공연등록인터페이스 basic informations
	
	public List<Exhibits> listHall();
	public List<Exhibits> listRate();
	
	public int insertExhibits(Exhibits dto,String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Exhibits> listExhibits(Map<String, Object> map);
	public Exhibits readExhibits(int exhibitNum);
	
	public int updateExhibits(Exhibits dto, String pathname);
	public int deleteExhibits(int exhibitNum,String pathname);
	
	
	
	
}
