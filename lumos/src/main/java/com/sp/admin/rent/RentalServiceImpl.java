package com.sp.admin.rent;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("rental.rentalService")
public class RentalServiceImpl implements RentalService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Rental readRental(int rentNum) {
		Rental dto = null;
		try {
			dto=dao.selectOne("rental.readRental", rentNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("rental.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Rental> listRental(Map<String, Object> map) {
		List<Rental> list = null;
		try {
			list = dao.selectList("rental.listRental", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
