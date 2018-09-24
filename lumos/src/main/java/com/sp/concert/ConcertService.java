package com.sp.concert;

import java.util.List;
import java.util.Map;

public interface ConcertService {
	public Concert readBoard(int num);
	public int updateBoard(Concert dto);
	public int insertBoardLike(Map<String, Object> map);
	public int deleteBoardLike(Map<String, Object> map);
	public int countBoardLike(Map<String, Object> map);
	public List<Concert> listConcertHall();
	public Concert readConcertHall(int num);
	public int updateConcertHall(Concert dto);
	public List<Concert> seatList(int num);
	public int insertList(Map<String, Object> map);
}
