package com.sp.admin.sales;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("sales.salesChartController")
public class SalesChartController {
	@RequestMapping(value="/admin/sales/salesSub/salesMain")//얘는 이름 자유로움
	public String main() throws Exception {
		return ".admin4.sales.salesSub.salesMain";
	}
	
	@RequestMapping(value="/admin/sales/salesSub/bar", produces="application/json; charset=utf-8")
	@ResponseBody
	public String bar(HttpServletRequest req, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		JSONArray arr = new JSONArray();
		JSONObject ob;
		
		map = new HashMap<String, Object>();
		map.put("name", "공연");
		map.put("data", new double[]{9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6});
		arr.put(map);
		
		ob=new JSONObject();
		ob.put("name", "전시");
		ob.put("data", new double[]{7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0});
		arr.put(ob);
		
		ob=new JSONObject();
		ob.put("name", "대관");
		ob.put("data", new double[]{4.0,1.3,4.0,11.3,17.6,21.6,23.8,24.1,18.9,12.3,6.6,1.2});
		arr.put(ob);
		
		JSONObject job=new JSONObject();
		job.put("year", "2018");
		job.put("series", arr);
		
		return job.toString();
	}
	
	@RequestMapping(value="/admin/sales/salesSub/concertPie", produces="application/json; charset=utf-8")
	@ResponseBody
	public String concertPie() throws Exception {
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "공연명");
		
		JSONArray ja=new JSONArray();
		ja.put(new JSONArray("['국립오페라단', 10]"));
		ja.put(new JSONArray("['피노키오', 30]"));
		ja.put(new JSONArray("['국립현대무용단 스텝업', 33]"));
		ja.put(new JSONArray("['소수미 콘서트', 20]"));
		ja.put(new JSONArray("['클라리넷 독주회', 10]"));
		
		ob.put("data", ja);
		
		arr.put(ob);

		return arr.toString();
	}
	
	@RequestMapping(value="/admin/sales/salesSub/exhibitPie", produces="application/json; charset=utf-8")
	@ResponseBody
	public String exhibitPie() throws Exception {
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "공연명");
		
		JSONArray ja=new JSONArray();
		ja.put(new JSONArray("['국립오페라단', 30]"));
		ja.put(new JSONArray("['피노키오', 10]"));
		ja.put(new JSONArray("['국립현대무용단 스텝업', 48]"));
		ja.put(new JSONArray("['소수미 콘서트', 5]"));
		ja.put(new JSONArray("['클라리넷 독주회', 10]"));
		
		ob.put("data", ja);
		
		arr.put(ob);

		return arr.toString();
	}
	
	@RequestMapping(value="/admin/sales/salesSub/daySalesLine", produces="application/json; charset=utf-8")
	@ResponseBody
	public String daySalesLine() throws Exception {
		JSONArray arr=new JSONArray();
		JSONObject ob=new JSONObject();
		ob.put("name", "시간");
		ob.put("data", new double[]{
				11.9,
				9.6,
				12.2,
				7.3,
				3.8,
				5.35,
				
				15.8,
				26.3,
				32.34,
				15.35,
				8.9,
				11.6,
				
				21.0,
				28.2,
				15.8,
				16.7,
				18.72,
				15.05,
				
				6.3,
				13.3,
				17.0,
				23.0,
				18.9,
				23.6
				});
		arr.put(ob);

		return arr.toString();
	}
}
