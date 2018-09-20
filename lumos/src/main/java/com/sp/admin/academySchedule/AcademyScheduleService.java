package com.sp.admin.academySchedule;

import java.util.List;
import java.util.Map;

public interface AcademyScheduleService {
	public int insertlocation(AcademySchedule dto);
	public int updatelocation(AcademySchedule dto);
	public int deletelocation(int locationNum);
	public AcademySchedule readlocation(int roomNum);
	public List<AcademySchedule> listlocation();
	
	public int insertHall(AcademySchedule dto);
	public int updateHall(AcademySchedule dto);
	public int deleteHall(int hallNum);
	public AcademySchedule readHall(int hallNum);
	public List<AcademyScheduleJSON> listHall();
	public List<AcademyScheduleJSON> listHall(int locationNum);
	
	public int insertScheduler(AcademySchedule dto);
	public int updateScheduler(AcademySchedule dto);
	public int deleteScheduler(Map<String, Object> map);
	public AcademySchedule readScheduler(int exhibitNum);
	public List<AcademyScheduleJSON> listScheduler(Map<String, Object> map);
	//나중에 확인할 것. ㅜㅜㅜㅜㅜ
}
