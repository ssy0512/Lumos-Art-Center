package com.sp.community.exhibitReview;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;
import com.sp.mypage.myactivity.All;

@Controller("community.exhibitReviewController")
public class ExhibitReviewController {
	@Autowired
	private ExhibitReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/community/exhibitReview")
	public String list(Model model) {

		List<All> bestList = null;
		bestList = service.eReviewBestList();
				
		model.addAttribute("bestList", bestList);
		return ".community.exhibitReview.list";
	}
	
	@RequestMapping(value="/community/exhibitReview/list")
	@ResponseBody
	public Map<String, Object> eReviewItemList(
			HttpSession session,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="order", defaultValue="latest") String order
			) throws Exception {
		
		//SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int rows=4;
		int dataCount=service.eDataCount();
		
		int total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("order", order);
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
		
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("pageNo", current_page);
		model.put("eReviewList", eReviewList);
		
		return model;
	}

	@RequestMapping(value="/community/exhibitReview/clickBest")
	@ResponseBody
	public Map<String, Object> clickBest(
			HttpSession session,
			@RequestParam(value="num") int num,
			@RequestParam(value="order", defaultValue="latest") String order
			) throws Exception {

		Map<String, Object> paramMap = new HashMap<>(); 
		paramMap.put("order", order);
		paramMap.put("num", num);
		
		int listNum = service.eReviewLocationCount(paramMap);
		int page = 0;

		if (listNum % 4 != 0)
			page += 1;

		// 게시글 순번/rows
		page += listNum / 4;

		Map<String, Object> model = new HashMap<>();
		model.put("listNum", listNum);
		model.put("location", page);
		model.put("num", num);
		
		return model;
	}
	
	// 게시글 좋아요 추가 :  : AJAX-JSON
		@RequestMapping(value="/community/exhibitReview/like")
		@ResponseBody
		public Map<String, Object> insertReviewLike(
				@RequestParam int num
				,HttpSession session
				,HttpServletResponse resp
				) throws Exception {
			Map<String, Object> model=new HashMap<>();
			String state="true";
			int reviewLikeCount=0;
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			if(info==null) {
				resp.sendError(403);
				return model;
			}
			Map<String, Object> paramMap=new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("userId", info.getUserId());
			int result=service.insertReviewLike(paramMap);
			if(result==0) {
				state="false";
			}
				
			reviewLikeCount = service.reviewLikeCount(num);
			
			model.put("state", state);
			model.put("reviewLikeCount", reviewLikeCount);
			
			return model;
		}
		
		// 댓글의 답글 개수 : AJAX-JSON
		@RequestMapping(value="/community/exhibitReview/likeCount")
		@ResponseBody
		public Map<String, Object> countReplyAnswer(
				@RequestParam int num
				) {
			
			int likeCount=service.reviewLikeCount(num);
			
			Map<String, Object> model=new HashMap<>();
			model.put("likeCount", likeCount);
			return model;
		}
}
