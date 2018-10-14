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
	public ExReview readExReviewForUpdate(Map<String, Object> map);
	public int updateExReview(ExReview dto);
	public int insertExReview(ExReview dto);
	public List<Exhibit> audienceList(int num);
	public int getUsableMileage(String userId);
}
