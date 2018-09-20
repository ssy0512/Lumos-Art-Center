package com.sp.concert;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.exhibit.schedule.DateUtil;
import com.sp.sch.Schedule;
import com.sp.sch.ScheduleService;

@Controller("concert.concertController")
public class ConcertController {
	@Autowired
	private ScheduleService service;
	
	@Autowired
	private ConcertSearchService searchService;
	
	@Autowired
	private DateUtil dUtil;
	
	@RequestMapping(value = "/concert/main", method = RequestMethod.GET)
	public String method() {
		return ".concert.main";
	}

	@RequestMapping(value = "/concert/list")
	public String list(@RequestParam(value = "period_type", defaultValue = "thisweek") String period_type,
			@RequestParam(name = "year", defaultValue = "0") int year,
			@RequestParam(value = "sch_hall", defaultValue = "") String sch_hall,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception  {
		
		Calendar cal = Calendar.getInstance();
		
		if (year == 0)
			year =  cal.get(Calendar.YEAR);
		
		System.out.println(year);
		List<String> hallList = searchService.listHall();
		
		String query="period_type="+period_type+"&year="+year;
		
		if(sch_hall.length()!=0) {
			query+="&sch_hall="+sch_hall;
		}
			
		if(searchValue.length()!=0) {
			query+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
		}
		

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchValue", searchValue);

		List<String> listSch_hall=null;
		if(sch_hall.length()!=0)
			listSch_hall=Arrays.asList(sch_hall.split(","));
		map.put("listSch_hall", listSch_hall);
		
		// 오늘 날짜 저장
		String today = dUtil.syadateToString();
		
		// 검색 기간
		if(period_type.equals("all")) {
			map.put("sDate", year+"-01-01");
			map.put("eDate", year+"-12-31");
		} else if(period_type.equals("thisweek")) {
			map.put("sDate", today);
			map.put("eDate", dUtil.toWeekEnd(today));
		} else if(period_type.equals("nextweek")) {
			map.put("sDate", dUtil.nextWeekStart(today));
			map.put("eDate", dUtil.nextWeekEnd(today));
		} else if(period_type.equals("month")) {
			map.put("sDate", today);
			map.put("eDate", dUtil.toMonthsLater(today, 1));
		} else if(period_type.equals("threemonths")) {
			map.put("sDate", today);
			map.put("eDate", dUtil.toMonthsLater(today, 3));
		}
		
		List<Concert> list = searchService.listSchedule(map);
		
		model.addAttribute("sDate", map.get("sDate"));
		model.addAttribute("eDate", map.get("eDate"));
		model.addAttribute("hallList", hallList);
		
		model.addAttribute("list", list);
		model.addAttribute("query", query);

		model.addAttribute("period_type", period_type);
		model.addAttribute("sch_hall", sch_hall);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("year", year);
		
		return "concert/list";
	}

	@RequestMapping(value = "/concert/monthly", method = RequestMethod.GET)
	public String monthSch(
			@RequestParam(name = "year", defaultValue = "0") int year,
			@RequestParam(name = "month", defaultValue = "0") int month,
			Model model) throws Exception {

		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1; // 0 ~ 11

		if (year == 0)
			year = y;
		if (month == 0)
			month = m;

		// 달력셋팅
		// year년 month월 1일의 요일
		cal.set(year, month - 1, 1);
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		int week = cal.get(Calendar.DAY_OF_WEEK); // 1~7

		// 첫주의 year년도 month월 1일 이전 날짜
		Calendar scal = (Calendar) cal.clone();
		scal.add(Calendar.DATE, -(week - 1));
		int syear = scal.get(Calendar.YEAR);
		int smonth = scal.get(Calendar.MONTH) + 1;
		int sdate = scal.get(Calendar.DATE);

		// 마지막주의 year년도 month월 말일주의 토요일 날짜
		Calendar ecal = (Calendar) cal.clone();
		// year년도 month월 말일
		ecal.add(Calendar.DATE, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		// year년도 month월 말일주의 토요일
		ecal.add(Calendar.DATE, 7 - ecal.get(Calendar.DAY_OF_WEEK));
		int eyear = ecal.get(Calendar.YEAR);
		int emonth = ecal.get(Calendar.MONTH) + 1;
		int edate = ecal.get(Calendar.DATE);

		// 스케쥴 가져오기
		String startDay = String.format("%04d%02d%02d", syear, smonth, sdate);
		String endDay = String.format("%04d%02d%02d", eyear, emonth, edate);
		Map<String, Object> map = new HashMap<>();
		map.put("startDay", startDay);
		map.put("endDay", endDay);

		List<Schedule> list = service.listMonth(map);

		String s;
		String[][] days = new String[cal.getActualMaximum(Calendar.WEEK_OF_MONTH)][7];

		// 1일 앞의 전달 날짜 및 일정 출력
		// startDay만 처리하고 endDay는 처리하지 않음(반복도 처리하지않음)
		// 날짜, 일정 넣기
		for (int i = 1; i < week; i++) {
			s = String.format("%04d%02d%02d", syear, smonth, sdate);
			days[0][i - 1] = "<span class='textDate preMonthDate' data-date='" + s + "' >" + sdate + "</span>";
			for (Schedule dto : list) {
				int today = Integer.parseInt(s.substring(4));
				String sd = dto.getSessionDate().substring(5, 10);
				int sd2 = Integer.parseInt(sd.replaceAll("-", ""));

				if (sd2 == today) {
					days[0][i - 1] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
							+ dto.getConcertNum() + "' onclick='goArticle(" + dto.getConcertNum() + ")'>"
							+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getConcertName() + "</span>";
				} else if (sd2 > today) {
					break;
				}

			}
			sdate++;
		}

		// year년도 month월 날짜 및 일정 출력
		// 날짜,일정 넣기
		int row, n = 0;
		jump: for (row = 0; row < days.length; row++) {
			for (int i = week - 1; i < 7; i++) {
				n++;
				s = String.format("%04d%02d%02d", year, month, n);

				if (i == 0) {
					days[row][i] = "<span class='textDate sundayDate' data-date='" + s + "' >" + n + "</span>";
				} else if (i == 6) {
					days[row][i] = "<span class='textDate saturdayDate' data-date='" + s + "' >" + n + "</span>";
				} else {
					days[row][i] = "<span class='textDate nowDate' data-date='" + s + "' >" + n + "</span>";
				}

				for (Schedule dto : list) {
					int today = Integer.parseInt(s.substring(4));
					String sd = dto.getSessionDate().substring(5, 10);
					int sd2 = Integer.parseInt(sd.replaceAll("-", ""));

					// 공연 시작날짜가 month안에 있을때
					if (sd2 == today) {
						days[row][i] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
								+ dto.getConcertNum() + "' onclick='goArticle(" + dto.getConcertNum() + ")'>"
								+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getConcertName() + "</span>";
					}
				}
				if (n == cal.getActualMaximum(Calendar.DATE)) {
					week = i + 1;
					break jump;
				}

			}
			week = 1;
		}

		// year년도 month월 마지막 날짜 이후 일정 출력
		// 일 넣기
		if (week != 7) {
			n = 0;
			for (int i = week; i < 7; i++) {
				n++;
				s = String.format("%04d%02d%02d", eyear, emonth, n);
				days[row][i] = "<span class='textDate nextMonthDate' data-date='" + s + "' >" + n + "</span>";

				for (Schedule dto : list) {
					int today = Integer.parseInt(s.substring(4));
					String sd = dto.getSessionDate().substring(5, 10);
					int sd2 = Integer.parseInt(sd.replaceAll("-", ""));

					// 공연 시작날짜가 표시된 마지막주 안에 있을때
					if (sd2 == today) {
						days[row][i] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
								+ dto.getConcertNum() + "' onclick='goArticle(" + dto.getConcertNum() + ")'>"
								+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getConcertName() + "</span>";
					} else if (sd2 > today) {
						break;
					}
				}
			}
		}

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("days", days);

		return "concert/monthly";
	}

	@RequestMapping(value = "/concert/annual")
	public String year(@RequestParam(name = "year", defaultValue = "0") int year,
			Model model) throws Exception {

		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);

		int todayYear = cal.get(Calendar.YEAR);
		String today = String.format("%04d%02d%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));

		if (year < 1900)
			year = y;

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		List<Schedule> list = service.listYear(map);

		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("todayYear", todayYear);
		model.addAttribute("today", today);

		return "concert/annual";
	}

	@RequestMapping(value = "/concert/article", method = RequestMethod.GET)
	public String article() {
		return ".concert.article";
	}

	@RequestMapping(value = "/concert/seatGuide", method = RequestMethod.GET)
	public String info() {
		return ".concert.seatGuide";
	}
}
