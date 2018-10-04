package com.sp.admin.membership;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.AdminUtil;

@Controller("regular.regularController")
public class RegularController {
	@Autowired
	private RegularService service;
	@Autowired
	private AdminUtil adminUtil;
	
	@RequestMapping(value="/admin/membership/regular/regularList")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="memberIndex") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
/*		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:.member.login";
		}*/
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
		
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = adminUtil.pageCount(rows, dataCount);
        
        if(total_page < current_page) 
            current_page = total_page;
        
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
        
        List<Regular> list = service.listRegular(map);
		
        int listNum, n = 0;
        Iterator<Regular> it = list.iterator();
        while (it.hasNext()) {
			Regular data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
        
        String query="";
        String listUrl = cp+"/admin/membership/regular/regularList";
        String articleUrl = cp+"/admin/membership/regular/article?page="+current_page;//page가 넘어가면 같이 따라가야함
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        if(query.length()!=0) {
        	listUrl = cp+"/admin/membership/regular/regularList?"+query;
        	articleUrl = cp+"/admin/membership/regular/article?page=" + current_page + "&"+ query;
        }
        String paging = adminUtil.paging(current_page, total_page, listUrl);
		model.addAttribute("subMenu", "1");
		model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		return ".admin4.membership.regular.regularList";
	}
	
	@RequestMapping(value="/admin/membership/regular/article")
	public String article(
			@RequestParam(value="memberIndex") int memberIndex,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue = "memberIndex") String searchKey,
			@RequestParam(value="searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception {
		
/*		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:.member.login";
		}*/
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		Regular dto = service.readRegular(memberIndex);
		if(dto==null)
			return "redirect:/admin/membership/regular/regularList?"+query;
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".admin4.membership.regular.article";
	}
}
