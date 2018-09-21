package com.sp.exhibit;

import java.util.List;
import java.util.Map;

public interface ExhibitService {
	public Exhibit readBoard(int num);
	public int updateBoard(Exhibit dto);
	public int insertBoardLike(Map<String, Object> map);
	public int deleteBoardLike(Map<String, Object> map);
	public int countBoardLike(Map<String, Object> map);
	public List<Exhibit> listExHall();
	public Exhibit readExHall(int num);
	public int updateExHall(Exhibit dto);
	public List<String> exhibitPrice(int num);
}
