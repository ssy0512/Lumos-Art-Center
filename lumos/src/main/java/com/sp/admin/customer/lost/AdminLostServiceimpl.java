package com.sp.admin.customer.lost;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("admin.customer.LostService")
public class AdminLostServiceimpl implements AdminLostService{

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Lost> listLost(Map<String, Object> map)
	{
		List<Lost>  list = null;
		try {
			list=dao.selectList("lost.listLost", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result= dao.selectOne("lost.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Lost readLost(int lostNum) {
		Lost dto = null;
		try {
			dto= dao.selectOne("lost.readLost", lostNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public void updateLostStatus(Lost dto) throws Exception {

		try {
			dao.updateData("lost.updateLostStatus", dto);
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public void insertLost(Lost dto) throws Exception {

		try {

			dao.insertData("lost.insertLost", dto);

		} catch (Exception e) {
			throw e;
		}

	}
}
