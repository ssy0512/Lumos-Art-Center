package com.sp.admin.sales;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("admin.sales.concertChartController")
public class ConcertChartController {
	@RequestMapping(value="/admin/sales/concert/concertSales")
	public String main() throws Exception {
		return ".admin4.sales.concert.concertSales";
	}
	
	@RequestMapping(value="/admin/sales/concert/ConcertBar", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ConcertBar() throws Exception {
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
	
	@RequestMapping(value="/admin/sales/concert/ConcertSales", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ConcertSales() throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;
		
		ob=new JSONObject();
		ob.put("name", "단위: 만 원");
		ob.put("data", new double[]{12031,41872,31680, 24520, 20830});
		arr.put(ob);
		
		JSONObject job=new JSONObject();
		job.put("subject", new String[] {"공연1", "공연2", "공연3", "공연4", "공연5"});
		job.put("series", arr);
		
		return job.toString();
	}
	
	@RequestMapping(value="/admin/sales/concert/ConcertPie3d", produces="application/json; charset=utf-8")
	@ResponseBody
	public String ConcertPie3d() throws Exception {
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
}
