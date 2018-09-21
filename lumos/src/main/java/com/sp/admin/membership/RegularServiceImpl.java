package com.sp.admin.membership;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("regular.regularService")
public class RegularServiceImpl implements RegularService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertRegular(Regular dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("regular.insertRegular", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Regular> listRegular(Map<String, Object> map) {
		List<Regular> list = null;
		try {
			list = dao.selectList("regular.listRegular", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("regular.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Regular readRegular(int memberIndex) {
		Regular dto = null;
		try {
			dto=dao.selectOne("regular.readRegular", memberIndex);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateRegular(Regular dto) {
		int result = 0;
		try {
			result = dao.selectOne("regular.readRegular", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}