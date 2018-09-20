package com.sp.notice;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customerCenter.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service; 
	@Autowired
	private MyUtil myUtil;

	
	@RequestMapping(value="/customerCenter/notice/list")
	public String list( 
			@RequestParam(value="page" , defaultValue="1") int current_page,
			@RequestParam(value="searchKey" , defaultValue="title") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		
		int rows = 10;
 		int total_page=0;
		int dataCount=0;
	
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue,"utf-8");
		}
		
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
			
		List<Notice> noticeList = null;
		if(current_page==1) {
			noticeList=service.listNoticeTop();
		}
		
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
				
		List<Notice> list = service.listNotice(map);
		
		
		Date endDate = new Date();
		long gap;
		int noticeNum, n =0;
		Iterator<Notice> it = list.iterator();
		while(it.hasNext()) {
			Notice data =(Notice)it.next();
			noticeNum = dataCount -(start + n -1);
			data.setNoticeNum(noticeNum);
		
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			
			Date beginDate = formatter.parse(data.getCreated());
		
			data.setCreated(data.getCreated().substring(0, 10));
			
			n++;
			
		}
		
		String cp=req.getContextPath();
		String query ="";
		String listUrl =cp+"/customerCenter/notice/list";
		String articleUrl = cp+"/customerCenter/notice/article?page="+ current_page;
		
		if(searchValue.length()!=0){
			query ="searchKey="+searchKey+"&serchValue=" +URLEncoder.encode(searchValue , "utf-8");
			
		}
		if(query.length()!=0) {
			listUrl = cp+"/customerCenter/notice/list?" + query;
			articleUrl = cp+"/customerCenter/notice/article?page=" + current_page + "&"+ query;
		}
		
		String paging = myUtil.paging(current_page, total_page,listUrl);
		model.addAttribute("noticeListCount",noticeList.size());
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("list" , list);
		model.addAttribute("page" , current_page);
		model.addAttribute("dataCount" , dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging" , paging);
		model.addAttribute("articleUrl" , articleUrl);

		return "customerCenter/notice/list";
		
		
		
	}
	
	@RequestMapping(value="/customerCenter/notice/created" ,method=RequestMethod.GET)
	public String createdForm(
			Model model , 
			HttpSession session
			) throws Exception{
		
			SessionInfo info =(SessionInfo)session.getAttribute("member");
			if(info==null) {
				return "redirect:/member/login";
			}
			
			if(! info.getUserId().equals("admin")) {
				return "redirect:/customerCenter/notice/list";
			}

			model.addAttribute("mode" , "created");
			
			return "customerCenter/notice/created";
		
	}
	
	@RequestMapping(value="/customerCenter/notice/created" , method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/customerCenter/notice/list";
		}
		
		dto.setUserId(info.getUserId());
		service.insertNotice(dto);
		
		return "redirect:/customerCenter/notice/list";
	}

	
	
	
	
	@RequestMapping(value="/customerCenter/notice/article")
	public String article(
			@RequestParam(value="num" ) int noticeNum,
			@RequestParam(value="searchKey", defaultValue="title") String searchKey,
			@RequestParam(value="searchValue",defaultValue="")String searchValue,
			@RequestParam(value="page") String page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		String query = "page=" + page;
		
		service.updateHitCount(noticeNum);
		
		Notice dto = service.readNotice(noticeNum);
		if(dto==null) {
			return "redirect:/customerCenter/notice/list?"+query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("noticeNum", noticeNum);
		
		Notice preReaDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		//문제있음 
		//model.addAttribute("dto",dto);
		model.addAttribute("noticeNum" , noticeNum); 
		model.addAttribute("preReaDto" , preReaDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page" , page);
		model.addAttribute("query" , query);
		
		return "customerCenter/customerCenter/notice/article";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/notice/update" , method =RequestMethod.GET)
	public String updateForm(
			
			) throws Exception{
		
		return "customerCenter/notice/created";
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
		public String updateSubmit() throws Exception{
			
		
		return "customerCenter/notice/created";
	}
	// delete return 바꿔야댐 
	@RequestMapping(value="/notice/delete")
	public String delete () throws Exception {
		
		
		return null;
	}
}

