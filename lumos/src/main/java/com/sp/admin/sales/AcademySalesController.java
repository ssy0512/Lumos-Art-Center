package com.sp.admin.sales;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.AdminUtil;


@Controller("sales.academySalesController")
public class AcademySalesController {	
	@Autowired
	private AcademySalesService service; 
	@Autowired
	private AdminUtil adminUtil;
	
	@RequestMapping(value="/admin/sales/academy/salesList")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="academyName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		int applyDateCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount!= 0)
			total_page=adminUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
				
		List<AcademySales> list=service.listAcademy(map);
		
		Date todayDate=new Date();
		long gap;
		
		int listNum, n=0;
		
		Iterator<AcademySales> it=list.iterator();
		
		while(it.hasNext()) {
			AcademySales data=it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			Date eDate=format.parse(data.getStartDate());
			
			gap=(eDate.getTime()-todayDate.getTime())/(24*60*60*1000);
			data.setGap(gap);
			
			n++;			
		}
		
		String query="";
		String listUrl=cp+"/admin/sales/academy/salesList?";
		String articleUrl=cp+"/admin/sales/academy/article?page="+current_page;
		if(searchValue.length()!=0) {
			query="searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		} 
		
		if(query.length()!=0) {
			listUrl=cp+"/admin/sales/academy/salesList?"+query;
			articleUrl=cp+"/admin/sales/academy/article?page="+current_page+"&"+query;
		}
				
		String paging=adminUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("applyDateCount", applyDateCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		return ".admin4.sales.academy.salesList";
	}
	
	@RequestMapping(value="/admin/sales/academy/article")
	public String article(
			@RequestParam(value="academyNum") int academyNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="academyName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}

		// 해당 레코드 가져 오기
		AcademySales dto=service.readAcademy(academyNum);				
		if(dto==null)
			return "redirect:/admin/sales/academy/salesList?"+query;		
			
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("academyNum", academyNum);
		
		List<AcademySales> totalSum = service.totalSum(academyNum);
		model.addAttribute("dto", dto);
		model.addAttribute("totalSum", totalSum);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
        return ".admin4.sales.academy.article";
	}
	
	@RequestMapping(value = "/admin/sales/academy/total")
	public String listTotal(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "academyNum") int academyNum,
			String searchValue, HttpServletRequest req,
			HttpSession session, Model model) throws Exception {

		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int totalCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();

		totalCount = service.totalCount(academyNum);
		
		if (totalCount != 0)
			total_page = adminUtil.pageCount(rows, totalCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("academyNum", academyNum);

		List<AcademySales> list = service.listOrders(map);
		map.put("academyNum", academyNum);
		
		int listNum, n = 0;
		
		Iterator<AcademySales> it = list.iterator();
		while (it.hasNext()) {
			AcademySales data = it.next();
			listNum = totalCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String listUrl = cp + "/admin/sales/academy/salesList";

		String paging = adminUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".admin4.sales.academy.total";
	}
}
