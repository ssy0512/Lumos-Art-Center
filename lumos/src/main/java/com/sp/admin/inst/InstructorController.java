package com.sp.admin.inst;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.servlet.View;

import com.sp.common.AdminUtil;
import com.sp.common.MyExcelView;

@Controller("instructor.instructorController")
public class InstructorController {
	@Autowired
	private InstructorService service;
	@Autowired
	private AdminUtil util;
	@Autowired
	private MyExcelView excelView;
	
	@RequestMapping(value="/admin/staff/instructor/instructorlist")
	public String listInstructor(
			@RequestParam(value="page",defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="instNum") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			)throws Exception{
		
		String cp = req.getContextPath();
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchKey);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page=util.pageCount(rows, dataCount);
		if(total_page<current_page)
			total_page=current_page;
		
		int start=(current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Instructor> list=service.listInstructor(map);
		int listNum , n =0;
		Iterator<Instructor> it = list.iterator();
		while(it.hasNext()) {
			Instructor data=it.next();
			listNum=dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/admin/staff/instructor/instructorlist";
		String articleUrl = cp="/admin/staff/instructor/article?page="+current_page;
		
		if(searchValue.length()!=0) {
			listUrl = cp+"/admin/staff/instructor/instructorlist?"+query;
			articleUrl=cp+"/admin/staff/instructor/article?page="+current_page;
		}
		String paging=util.paging(current_page, total_page,listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return ".admin4.staff.instructor.instructorlist";
	}
	@RequestMapping(value="/admin/staff/instructor/article")
	public String article (@RequestParam(value="instNum") int instNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="instName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue= URLDecoder.decode(searchValue, "utf-8");
		String query="page="+page;
		if(searchValue.length()!=0) {
			query="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Instructor dto = service.readInstructor(instNum);
		
		if(dto==null)
			return "redirect:admin/staff/instructor/instructorlist?"+query;
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		return ".admin4.staff.instructor.article";
		
	}
	
	@RequestMapping(value="/admin/staff/instructor/created",method=RequestMethod.GET) 
	public String created (Model model) throws Exception{
		
		model.addAttribute("page","1");
		model.addAttribute("mode","created");
		
		return ".admin4.staff.instructor.created";
	}
	
	@RequestMapping(value="/admin/staff/instructor/created",method=RequestMethod.POST)
	public String createdOk (Instructor dto, HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"image";
		service.insertInstructor(dto, pathname);
		
		return "redirect:/admin/staff/instructor/instructorlist";
	}
	@RequestMapping(value="/admin/staff/instructor/update",method=RequestMethod.GET)
	public String updateStaff (
			@RequestParam(value="instNum") int instNum,
			@RequestParam(value="page",defaultValue="1") String page,
			Model model
			) throws Exception {
		
		Instructor dto = service.readInstructor(instNum);
		if(dto==null) {
			return "redirect:/staff/instructor/instructorlist?page="+page;
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("dto",dto);
		
		return ".admin4.staff.instructor.created";
	}
	
	@RequestMapping(value="/admin/staff/instructor/update",method=RequestMethod.POST)
	public String updateSubmit(Instructor dto, @RequestParam String page,HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+"uploads"+File.separator+"image";
		service.updateInstructor(dto, pathname);
		return "redirect:/staff/instructor/article?listNum="+dto.getListNum()+"&page="+page;
	}
	
	@RequestMapping(value="/admin/staff/instructor/delete",method=RequestMethod.POST)
	public String deleteStaff (@RequestParam(value="instNum") int instNum,
							@RequestParam String page, HttpSession session) {
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"image";
		
		service.deleteInstructor(instNum, pathname);
		return "redirect:/staff/instructor/instructorlist?page="+page;
	}
	
	@RequestMapping(value="/admin/staff/instructor/excel")
	public View excel (Map<String, Object> model) throws Exception{
		
		String sheetName = "강사목록";
		String filename="instructor.xls";
		List<String> columnLabels=new ArrayList<>();
		List<Object[]> columnValues=new ArrayList<>();
		
		columnLabels.add("번호");
		columnLabels.add("강사명");
		columnLabels.add("생년월일");
		columnLabels.add("전화번호");
		
		List<Instructor> list=service.listAllInstructor();
		for(Instructor dto:list) {
			columnValues.add(new Object[] {dto.getInstNum(),dto.getInstName(),dto.getBirth(),dto.getTel()});
		}
		
		model.put("sheetName",sheetName);
		model.put("filename", filename);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);
		
		return excelView;
	}
	
}
