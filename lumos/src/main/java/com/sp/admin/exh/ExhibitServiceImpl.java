package com.sp.admin.exh;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
@Service("exh.exhibitService")
public class ExhibitServiceImpl implements ExhibitService{
	@Autowired
	private CommonDAO dao;
	@Override
	public int insertlocation(ExhibitSch es) {
		int result=0;
		try {
			result=dao.insertData("exh.insertlocation",es);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updatelocation(ExhibitSch es) {
		int result=0;
		try {
			result=dao.updateData("exh.updatelocation",es);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deletelocation(int locationNum) {
		int result=0;
		try {
			result=dao.deleteData("exh.deleteloacation",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ExhibitSch readlocation(int locationNum) {
		ExhibitSch es=null;
		try {
			es=dao.selectOne("exh.readlocation",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return es;
	}

	@Override
	public List<ExhibitSch> listlocation() {
		List<ExhibitSch> list=null;
		try {
			list=dao.selectList("exh.listlocation");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertHall(ExhibitSch es) {
		int result=0;
		try {
			result=dao.insertData("exh.insertHall",es);
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateHall(ExhibitSch es) {
		int result=0;
		try {
			result=dao.updateData("exh.updateHall",es);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteHall(int hallNum) {
		int result=0;
		try {
			result=dao.deleteData("exh.deleteHall",hallNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ExhibitSch readHall(int hallNum) {
		ExhibitSch es=null;
		try {
			es=dao.selectOne("exh.readHall",hallNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return es;
	}

	@Override
	public List<ExhibitSch> listHall(int locationNum) {
		List<ExhibitSch> list=null;
		try {
			list=dao.selectList("exh.listHall2",locationNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertScheduler(ExhibitSch es) {
		int result=0;
		try {
			result=dao.insertData("exh.insertScheduler",es);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateScheduler(ExhibitSch es) {
		int result=0;
		try {
			result=dao.updateData("exh.updateScheduler",es);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteScheduler(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("exh.deleteScheduler",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ExhibitSch readScheduler(int exhibitNum) {
		ExhibitSch es=null;
		try {
			es=dao.selectOne("exh.readScheduler",exhibitNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return es;
	}

	@Override
	public List<ExhibitJSON> listScheduler(Map<String, Object> map) {
		List<ExhibitJSON> list=null;
		try {
			list=dao.selectList("exh.listScheduler",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<ExhibitJSON> listHall() {
		List<ExhibitJSON> list=null;
		try {
			list=dao.selectList("exh.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
}
