package com.sp.mypage.myactivity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;


@Controller("mypage.myActivityController")
public class MyActivityController {
	@Autowired
	private MyActivityService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mypage/myActivity")
	public String main() {
		return ".mypage.myActivity.main";
	}
	
	@RequestMapping(value="/mypage/myActivity/all/list")
	public String allList(
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<All> eReviewList = null;
		eReviewList = service.alleReviewList(info.getUserId());
		
		List<All> cReviewList = null;
		cReviewList = service.allcReviewList(info.getUserId());
		
		List<All> myQnaList = null;
		myQnaList = service.allmyQnaList(info.getUserId());
		
		model.addAttribute("myQnaList", myQnaList);
		model.addAttribute("cReviewList", cReviewList);
		model.addAttribute("eReviewList", eReviewList);
		return "/mypage/myActivity/all/list";
	}
	
	@RequestMapping(value="/mypage/myActivity/cReview/list")
	public String cReviewList() throws Exception {

		return "/mypage/myActivity/cReview/list";
	}
	
	@RequestMapping(value="/mypage/myActivity/cReviewItemList")
	@ResponseBody
	public Map<String, Object> cReviewItemList(
			HttpSession session,
			@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int rows=2;
		int dataCount=service.cDataCount(info.getUserId());
		
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", info.getUserId());
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		
		List<All> cReviewList = null;
		cReviewList = service.cReviewList(paramMap);
		Iterator<All> it=cReviewList.iterator();
		while(it.hasNext()) {
			All dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		
		Map<String, Object> model = new HashMap<>(); 
		// 데이터개수
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("cReviewList", cReviewList);
		
		return model;
	}
	
	@RequestMapping(value="/mypage/myActivity/eReview/list")
	public String eReviewList() {
		return "/mypage/myActivity/eReview/list";
	}
	
	@RequestMapping(value="/mypage/myActivity/eReviewItemList")
	@ResponseBody
	public Map<String, Object> eReviewItemList(
			HttpSession session,
			@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int rows=2;
		int dataCount=service.eDataCount(info.getUserId());
		
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", info.getUserId());
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		
		List<All> eReviewList = null;
		eReviewList = service.eReviewList(paramMap);
		Iterator<All> it=eReviewList.iterator();
		while(it.hasNext()) {
			All dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		
		Map<String, Object> model = new HashMap<>(); 
		// 데이터개수
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("eReviewList", eReviewList);
		
		return model;
	}	
	
	@RequestMapping(value="/mypage/myActivity/myQna/list")
	public String myQnaList() {
		return "/mypage/myActivity/myQna/list";
	}
	
	@RequestMapping(value="/exhibitReview/delete")
	@ResponseBody
	public Map<String, Object> deleteEReview(
			@RequestParam(value="num") int num
			) {
		
		String state;
		int result=service.deleteEReview(num);
		if(result==1)
			state="true";
		else 
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
}
