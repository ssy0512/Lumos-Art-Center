package com.sp.admin.sales;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.sales.exhibitChartController")
public class ExhibitChartController {
/*	@Autowired
	private ExhibitMainService service;
	@Autowired
	private AdminUtil adminUtil;*/
	
	@RequestMapping(value="/admin/sales/exhibit/exhibitSales")
	public String main() throws Exception {
		return ".admin4.sales.exhibit.exhibitSales";
	}
	
	@RequestMapping(value="/admin/sales/exhibit/ExhibitBar", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ExhibitBar() throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;
		
		ob=new JSONObject();
		ob.put("name", "인원 수 (단위: 명)");
		ob.put("data", new double[]{12031,41872,31680, 24520, 20830});
		arr.put(ob);
		
		JSONObject job=new JSONObject();
		job.put("subject", new String[] {"공연1", "공연2", "공연3", "공연4", "공연5"});
		job.put("series", arr);
		
		return job.toString();
	}
	
	@RequestMapping(value="/admin/sales/exhibit/Exhibit3d", produces="application/json; charset=utf-8")
	@ResponseBody
	public String Exhibit3d() throws Exception {
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "공연명");
		
		JSONArray ja=new JSONArray();
		ja.put(new JSONArray("['공연1', 10]"));
		ja.put(new JSONArray("['공연2', 30]"));
		ja.put(new JSONArray("['공연3', 33]"));
		ja.put(new JSONArray("['공연4', 20]"));
		ja.put(new JSONArray("['공연5', 10]"));
		
		ob.put("data", ja);
		
		arr.put(ob);
		
		System.out.println(arr.toString());
		return arr.toString();
	}
	
/*	@RequestMapping(value="/admin/sales/exhibit/exhibitSales")
	public String listMain(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = adminUtil.pageCount(rows, dataCount);
        
        if(total_page < current_page) 
            current_page = total_page;
        
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
        
        List<ExhibitSales> list = service.listMain(map);
        
        int listNum, n = 0;
        Iterator<ExhibitSales> it = list.iterator();
        while (it.hasNext()) {
        	ExhibitSales data = it.next();
        	listNum = dataCount - (start + n - 1);
        	data.setListNum(listNum);
            n++;
        }
	
        String query = "";
        String listUrl = cp+"/admin/sales/exhibit/exhibitSales";
        String articleUrl = cp+"/admin/sales/exhibit/article?page="+current_page;
        if(query.length()!=0) {
        	listUrl = cp+"/admin/sales/exhibit/exhibitSales?"+query;
        	articleUrl = cp+"/admin/sales/exhibit/article?page=" + current_page + "&"+ query;
        }
        
        String paging = adminUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		return ".admin4.sales.exhibit.exhibitSales";
	}*/
}
