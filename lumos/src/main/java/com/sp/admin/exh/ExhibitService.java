package com.sp.admin.exh;

import java.util.List;
import java.util.Map;

public interface ExhibitService {
	public int insertlocation(ExhibitSch es);//없어도 되는거 아닌가?....
	public int updatelocation(ExhibitSch es);
	public int deletelocation(int locationNum);
	public ExhibitSch readlocation(int locationNum);
	public List<ExhibitSch> listlocation();
	
	public int insertHall(ExhibitSch es);
	public int updateHall(ExhibitSch es);
	public int deleteHall(int hallNum);
	public ExhibitSch readHall(int hallNum);
	public List<ExhibitJSON> listHall();
	public List<ExhibitSch> listHall(int locationNum);
	
	public int insertScheduler(ExhibitSch es);
	public int updateScheduler(ExhibitSch es);
	public int deleteScheduler(Map<String, Object> map);
	public ExhibitSch readScheduler(int exhibitNum);
	public List<ExhibitJSON> listScheduler(Map<String, Object> map);
	
}
