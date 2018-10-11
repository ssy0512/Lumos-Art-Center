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
import com.sp.concert.Concert;

@Controller("sales.concertSalesController")
public class ConcertSalesController {
	@Autowired
	private ConcertSalesService service;
	@Autowired
	private AdminUtil adminUtil;

	@RequestMapping(value = "/admin/sales/concert/salesList")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "concertNum") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			HttpSession session, Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = adminUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<ConcertSales> list = service.listConcertSales(map);
		int listNum, n = 0;
		Iterator<ConcertSales> it = list.iterator();
		while (it.hasNext()) {
			ConcertSales data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/admin/sales/concert/salesList";
		String articleUrl = cp + "/admin/sales/concert/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/admin/sales/concert/salesList?" + query;
			articleUrl = cp + "/admin/sales/concert/article?page=" + current_page + "&" + query;
		}
		String paging = adminUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".admin4.sales.concert.salesList";
	}

	@RequestMapping(value="/admin/sales/concert/article", method=RequestMethod.GET)
	public String article(
			@RequestParam(value = "concertNum") int concertNum,
			@RequestParam(value = "page") String page,
			@RequestParam(value = "searchKey", defaultValue = "concertNum") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		ConcertSales dto = service.readConcertSales(concertNum);
		if(dto==null)
			return "redirect:admin/sales/concert/salesList?"+query;
		
		List<Concert> seatList = service.seatList(concertNum);
		Map<String, Object> map = new HashMap<>();
		String seatPriceList = "";
		
		if(seatList.size()!=0 && dto.getSeatPriceList()==null ) {
			map.put("concertNum", concertNum);
			for(Concert dto2 : seatList) {
				seatPriceList+=dto2.getSeatLevel()+" "+String.format("%,d",dto2.getSeatPrice())+" / ";
			}
			seatPriceList=seatPriceList.substring(0,seatPriceList.length()-2);
			
			map.put("seatPriceList", seatPriceList);
			dto = service.readConcertSales(concertNum);
		}
		
		List<ConcertSales> totalSum = service.totalSum(concertNum);
		int totalCount = service.totalCount(concertNum);
		
		//long totalSum = service.totalSum();
		model.addAttribute("totalSum", totalSum);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return ".admin4.sales.concert.article";
	}

	@RequestMapping(value = "/admin/sales/concert/total")
	public String listTotal(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "concertNum") int concertNum,
			@RequestParam(value = "searchKey", defaultValue = "approveNum") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			HttpSession session, Model model) throws Exception {

		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int totalCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		totalCount = service.totalCount(concertNum);
		if (totalCount != 0)
			total_page = adminUtil.pageCount(rows, totalCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<ConcertSales> list = service.listOrders(map);
		int listNum, n = 0;
		Iterator<ConcertSales> it = list.iterator();
		while (it.hasNext()) {
			ConcertSales data = it.next();
			listNum = totalCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/admin/sales/concert/salesList";
		//String articleUrl = cp + "/admin/sales/concert/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/admin/sales/concert/salesList?" + query;
			//articleUrl = cp + "/admin/sales/concert/article?page=" + current_page + "&" + query;
		}
		String paging = adminUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		//model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".admin4.sales.concert.total";
	}
}
