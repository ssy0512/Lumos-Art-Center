package com.sp.rentfront;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("rentfront.rentFrontService")
public class RentFrontServiceImpl implements RentFrontService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public RentFront readBoard(int num) {
		RentFront dto=null;

		try {
			dto=dao.selectOne("rentfront.readRentfront", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateBoard(RentFront dto) {
		int result=0;
		
		try {
			dao.updateData("rentfront.updateRentfront", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<RentFront> listExHall() {
		List<RentFront> list=null;
		
		try {
			list=dao.selectList("rentfront.listExHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	@Override
	public RentFront readExHall(int num) {
		RentFront dto=null;
		
		try {
			dto=dao.selectOne("rentfront.readExHall", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	@Override
	public List<RentFront> listHall() {
		List<RentFront> list=null;
		
		try {
			list=dao.selectList("rentfront.listHall");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	@Override
	public RentFront readHall(int num) {
		RentFront dto=null;
		
		try {
			dto=dao.selectOne("rentfront.readHall", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}
	
}
