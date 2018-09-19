package com.sp.admin.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("question.questionService")
public class QuestionsServiceImpl implements QuestionsService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertQuestion(Questions dto, String mode) {
		int result=0;
		try {
			int seq=dao.selectOne("question_seq");
			dto.setPostNum(seq);
			
			if(mode.equals("created")) {
				dto.setGroupNum(seq);
			}else if(mode.equals("reply")) {
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				
				dao.updateData("question.updateOrderNo",map);
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			result=dao.insertData("question.insertQuestion",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("question.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Questions> listQuestion(Map<String, Object> map) {
		List<Questions> list=null;
		try {
			list=dao.selectList("question.listQuestion",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Questions readQeustion(int postNum) {
		Questions dto=null;
		try {
			dto=dao.selectOne("question.readQuestion",postNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Questions preReadQuestion(Map<String, Object> map) {
		Questions dto=null;
		try {
			dto=dao.selectOne("question.preReadQuestion",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Questions nextReadQuestion(Map<String, Object> map) {
		Questions dto=null;
		try {
			dto=dao.selectOne("question.nextReadQuestion",map);
		} catch (Exception e) {
			System.out.println(e.toString()); 
		}
		return dto;
	}

	@Override
	public int updateQuestion(Questions dto) {
		int result=0;
		try {
			result=dao.updateData("question.updateQuestion",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteQuestion(int postNum) {
		int result=0;
		try {
			result=dao.deleteData("question.deleteQuestion",postNum);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
