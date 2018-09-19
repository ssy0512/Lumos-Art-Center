package com.sp.admin.scheduler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("scheduler.concertService")
public class ConcertServiceImpl implements ConcertService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertlocation(ConcertSch cs) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertlocation",cs);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updatelocation(ConcertSch cs) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updatelocation",cs);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deletelocation(int locationNum) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteloacation",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ConcertSch readlocation(int locationNum) {
		ConcertSch cs=null;
		try {
			cs=dao.selectOne("scheduler.readlocation",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cs;
	}

	@Override
	public List<ConcertSch> listlocation() {
		List<ConcertSch> list=null;
		try {
			list=dao.selectList("scheduler.listlocation");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertHall(ConcertSch cs) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertHall",cs);
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateHall(ConcertSch cs) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updateHall",cs);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteHall(int hallNum) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteHall",hallNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ConcertSch readHall(int hallNum) {
		ConcertSch cs=null;
		try {
			cs=dao.selectOne("scheduler.readHall",hallNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cs;
	}

	@Override
	public List<ConcertSchJSON> listHall() {
		List<ConcertSchJSON> list=null;
		try {
			list=dao.selectList("scheduler.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<ConcertSch> listHall(int locationNum) {
		List<ConcertSch> list=null;
		try {
			list=dao.selectList("scheduler.listHall2",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertScheduler(ConcertSch cs) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertScheduler",cs);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateScheduler(ConcertSch cs) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updateScheduler",cs);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteScheduler(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteScheduler",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ConcertSch readScheduler(int concertNum) {
		ConcertSch cs=null;
		try {
			cs=dao.selectOne("scheduler.readScheduler",concertNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cs;
	}

	@Override
	public List<ConcertSchJSON> listScheduler(Map<String, Object> map) {
		List<ConcertSchJSON> list=null;
		try {
			list=dao.selectList("scheduler.listScheduler",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
