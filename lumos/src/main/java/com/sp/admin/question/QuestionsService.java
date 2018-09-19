package com.sp.admin.question;

import java.util.List;
import java.util.Map;

public interface QuestionsService {
	public int insertQuestion(Questions dto, String mode);
	public int dataCount(Map<String, Object> map);
	public List<Questions> listQuestion(Map<String, Object> map);
	
	public Questions readQeustion(int postNum);
	
	
	public Questions preReadQuestion(Map<String, Object> map);
	public Questions nextReadQuestion(Map<String, Object> map);
	
	public int updateQuestion(Questions dto);
	public int deleteQuestion(int postNum);
}
