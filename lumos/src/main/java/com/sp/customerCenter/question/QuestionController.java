package com.sp.customerCenter.question;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customerCenter.questionController")
public class QuestionController {
	@Autowired
	private QuestionsService service;
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/customerCenter/questions/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey",defaultValue="title") String searchKey,
			@RequestParam(value="searchValue",defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		int rows=10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		total_page=util.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows +1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Questions> list=service.listQuestion(map);
		
		int listNum,n=0;
		for(Questions dto:list) {
			listNum = dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String paging=util.paging(current_page, total_page);
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("page",current_page);
		model.addAttribute("paging",paging);
		model.addAttribute("total_page",total_page);
		
		return "customerCenter/questions/list";
	}
	@RequestMapping(value="/customerCenter/questions/created",method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		model.addAttribute("page","1");
		model.addAttribute("mode","created");
		return "customerCenter/questions/created";
	}
	
	@RequestMapping(value="/customerCenter/questions/created",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(Questions dto,HttpSession session)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		dto.setUserId(info.getUserId());
		service.insertQuestion(dto, "created");
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	@RequestMapping(value="/customerCenter/questions/article")
	public String article(
			@RequestParam(value="postNum") int postNum,
			@RequestParam(value="page")String page,
			@RequestParam(value="searchKey",defaultValue="1")String searchKey,
			@RequestParam(value="searchValue",defaultValue="")String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		
		Questions dto=service.readQeustion(postNum);
		if(dto==null)
			return ".customerCenter.error";
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		
		Questions preReadQuestion=service.preReadQuestion(map);
		Questions nextReadQuestion=service.nextReadQuestion(map);
		model.addAttribute("dto",dto);
		model.addAttribute("preReadQuestion",preReadQuestion);
		model.addAttribute("nextReadQuestion",nextReadQuestion);
		model.addAttribute("page",page);
	
		return "customerCenter/questions/article";
	}
	
	@RequestMapping(value="/customerCenter/questions/delete",method=RequestMethod.POST)
	public Map<String, Object> delete(
			@RequestParam(value="postNum") int postNum,
			HttpSession session
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		Questions dto=service.readQeustion(postNum);
		
		if(dto!=null) {
			if(info.getUserId().equals("admin")||info.getUserId().equals(dto.getUserId()));
			service.deleteQuestion(postNum);
			state="true";
		}
		

		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
		
	
	
	@RequestMapping(value="/customerCenter/questions/update",method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="postNum") int postNum,
			@RequestParam(value="page",defaultValue="1")String page,
			HttpSession session,
			Model model
			)throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Questions dto=service.readQeustion(postNum);
		if(dto==null) {
			return ".customerCenter.error";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return ".customerCenter.error";
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("dto",dto);
		
		return "customerCenter/questions/created";
	}
	
	@RequestMapping(value="/customerCenter/questions/update",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(Questions dto, @RequestParam String page)throws Exception{
		String state="true";
		
		service.updateQuestion(dto);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	@RequestMapping(value="/customerCenter/questions/reply", method=RequestMethod.GET)
	public String replyForm (
			@RequestParam (value="postNum")int postNum,
			@RequestParam (value="page")String page,
			HttpSession session,
			Model model 
			) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return ".customerCenter.error";
		}
		
		Questions dto=service.readQeustion(postNum);
		if(dto==null) {
			return ".customerCenter.error";
		}
		String str="["+dto.getTitle()+"] 에 대한 관리자의 답변입니다. \n";
		dto.setContent(str);
		
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("mode","reply");
		
		return "customerCenter/questions/created";
	}
	
	@RequestMapping(value="/customerCenter/questions/reply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replySubmit(
			Questions dto,
			HttpSession session
			)throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setUserId(info.getUserId());
		service.insertQuestion(dto, "reply");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);

		return model;
	}
	
}
