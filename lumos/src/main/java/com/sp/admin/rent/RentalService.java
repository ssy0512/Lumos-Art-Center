package com.sp.admin.rent;

import java.util.List;
import java.util.Map;

public interface RentalService {
	public Rental readRental(int rentNum);
	public int dataCount(Map<String, Object> map);
	public List<Rental> listRental(Map<String, Object> map);
}
