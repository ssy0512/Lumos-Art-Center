package com.sp.rentfront;

import java.util.List;

public interface RentFrontService {
	public RentFront readBoard(int num);
	public int updateBoard(RentFront dto);
	public List<RentFront> listExHall();
	public RentFront readExHall(int num);
	public List<RentFront> listHall();
	public RentFront readHall(int num);
}
