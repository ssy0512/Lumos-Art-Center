package com.sp.admin.sales;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.AdminUtil;

@Controller("sales.exhibitSalesController")
public class ExhibitSalesController {
	@Autowired
	private ExhibitSalesService service;
	@Autowired
	private AdminUtil adminUtil;
	
	@RequestMapping(value="/admin/sales/exhibit/salesList")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="exhibitNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
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
        
        List<ExhibitSales> list = service.listExhibitSales(map);
        
        int listNum, n = 0;
        Iterator<ExhibitSales> it = list.iterator();
        while (it.hasNext()) {
        	ExhibitSales data = it.next();
        	listNum = dataCount - (start + n - 1);
        	data.setListNum(listNum);
            n++;
        }
	
        String query = "";
        String listUrl = cp+"/admin/sales/exhibit/salesList";
        String articleUrl = cp+"/admin/sales/exhibit/article?page="+current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        if(query.length()!=0) {
        	listUrl = cp+"/admin/sales/exhibit/salesList?"+query;
        	articleUrl = cp+"/admin/sales/exhibit/article?page=" + current_page + "&"+ query;
        }
        
        String paging = adminUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".admin4.sales.exhibit.salesList";
	}
	
	@RequestMapping(value="/admin/sales/exhibit/article", method = RequestMethod.GET)
	public String article(
			@RequestParam(value="exhibitNum") int exhibitNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="exhibitNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		
		ExhibitSales dto = service.readExhibitSales(exhibitNum);
		if(dto==null)
			return "redirect:admin/sales/exhibit/salesList?"+query;
		
		List<String> listPrice = service.exhibitPrice(exhibitNum);
		
		if(listPrice!=null && listPrice.size() > 0) {
			String exPriceString="";
			for( String s : listPrice) {
				exPriceString+=s+" / ";
			}
			exPriceString=exPriceString.substring(0, exPriceString.length()-3);
			dto.setExPriceString(exPriceString);
		}
		
		List<ExhibitSales> totalSum = service.totalSum(exhibitNum);
		
		//long totalSum = service.totalSum(exhibitNum);
		//model.addAttribute("totalSum", totalSum);
		model.addAttribute("totalSum", totalSum);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return ".admin4.sales.exhibit.article";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/admin/sales/exhibit/total")
	public String listTotal(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "exhibitNum") int exhibitNum,
			String searchValue, HttpServletRequest req,
			HttpSession session, Model model) throws Exception {

		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int totalCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();

		totalCount = service.totalCount(exhibitNum);
		
		if (totalCount != 0)
			total_page = adminUtil.pageCount(rows, totalCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("exhibitNum", exhibitNum);

		List<ExhibitSales> list = service.listOrders(map);
		
		int listNum, n = 0;
		
		Iterator<ExhibitSales> it = list.iterator();
		while (it.hasNext()) {
			ExhibitSales data = it.next();
			listNum = totalCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String listUrl = cp + "/admin/sales/exhibit/salesList";

		String paging = adminUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".admin4.sales.exhibit.total";
	}
}
