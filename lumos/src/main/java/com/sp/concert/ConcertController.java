package com.sp.concert;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.sch.Schedule;
import com.sp.sch.ScheduleService;

@Controller("concertController")
public class ConcertController {
	@Autowired
	private ScheduleService service;

	@RequestMapping(value = "/concert/main", method = RequestMethod.GET)
	public String method() {
		return ".concert.main";
	}

	@RequestMapping(value = "/concert/list", method = RequestMethod.GET)
	public String list() {
		return "concert/list";
	}

	@RequestMapping(value = "/concert/month", method = RequestMethod.GET)
	public String monthSch(
			@RequestParam(name = "year", defaultValue = "0") int year,
			@RequestParam(name = "month", defaultValue = "0") int month,
			Model model) {
		try {
			Calendar cal = Calendar.getInstance();
			int y = cal.get(Calendar.YEAR);
			int m = cal.get(Calendar.MONTH) + 1; // 0 ~ 11

			if (year == 0)
				year = y;
			if (month == 0)
				month = m;
			
			//달력셋팅
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
			String endMonth = String.format("%04d%02d", eyear, emonth);
			String startMonth = String.format("%04d%02d", syear, smonth);
			Map<String, Object> map = new HashMap<>();
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			map.put("endMonth",endMonth);
			map.put("startMonth",startMonth);
			
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
					String sd = dto.getSessionDate().substring(5,10);
					int sd2=Integer.parseInt(sd.replaceAll("-", ""));
					
					if (sd2 == today) {
							days[0][i - 1] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
									+ dto.getConcertNum() + "' onclick='goArticle("+dto.getConcertNum()+")'>"
									+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getConcertName() + "</span>";
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
						String sd = dto.getSessionDate().substring(5,10);
						int sd2=Integer.parseInt(sd.replaceAll("-", ""));
						
						// 공연 시작날짜가 month안에 있을때
						if (sd2 == today) {
								days[row][i]+= "<span class='scheduleSubject' data-date='" + sd2+ "' data-num='"
										+ dto.getConcertNum() + "' onclick='goArticle("+dto.getConcertNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getConcertName() + "</span>";
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
						String sd = dto.getSessionDate().substring(5,10);
						int sd2=Integer.parseInt(sd.replaceAll("-", ""));
						
						// 공연 시작날짜가 표시된 마지막주 안에 있을때
						if (sd2 == today) {
								days[row][i]+= "<span class='scheduleSubject' data-date='" + sd2+ "' data-num='"
										+ dto.getConcertNum() + "' onclick='goArticle("+dto.getConcertNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getConcertName() + "</span>";
						} else if (sd2 > today) {
							break;
						}
					}
				}
			}
			// 일정 넣기
/*			week=rweek;
			if (week != 7) {
				n = 0;
				for (int i = week; i < 7; i++) {
					n++;
					s = String.format("%04d%02d%02d", eyear, emonth, n);
					
					for (Schedule dto : list) {
						int today = Integer.parseInt(s.substring(4));
						String sd = dto.getConcertStart().substring(5,10);
						int sd2=Integer.parseInt(sd.replaceAll("-", ""));
						
						int sddate = Integer.parseInt(dto.getConcertStart().substring(8,10));
						
						int ii=i;

						// 공연 시작날짜가 표시된 마지막주 안에 있을때
						if (sd2 == today) {
							for(int j=sddate;j<7;j++) {
								
								days[row][ii]+= "<span class='scheduleSubject' data-date='" + s + "' data-num='"
									+ dto.getConcertNum() + "' >" +dto.getHallName()+"&nbsp;&nbsp;"+ dto.getConcertName() + "</span>";
								ii++;
							}
						} else if (sd2 > today) {
							break;
						}
					}

				}
			}*/

			model.addAttribute("year", year);
			model.addAttribute("month", month);
			model.addAttribute("days", days);
		} catch (Exception e) {
		}

		return "concert/month";
	}

	@RequestMapping(value="/concert/year")
	public String year(
			@RequestParam(name="year", defaultValue="0") int year,
			Model model
			) {
		
		try {
			Calendar cal=Calendar.getInstance();
			int y=cal.get(Calendar.YEAR);
			
			int todayYear=cal.get(Calendar.YEAR);
			String today=String.format("%04d%02d%02d",
					cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE));

			if(year<1900)
				year=y;

			String days[][][] = new String[12][6][7];
			
			int row, col, month_of_day;
			String s;
			for(int m = 1; m<=12; m++) {
				cal.set(year, m-1, 1);
	            row = 0;
	            col = cal.get(Calendar.DAY_OF_WEEK)-1;
	            month_of_day=cal.getActualMaximum(Calendar.DATE);
	            for(int i = 1; i<=month_of_day; i++)  {
	            	s=String.format("%04d%02d%02d", year, m, i);
	            	
	            	if(col==0) {
	            		days[m-1][row][col]="<span class='textDate sundayDate' data-date='"+s+"' >"+i+"</span>";
					} else if(col==6) {
						days[m-1][row][col]="<span class='textDate saturdayDate' data-date='"+s+"' >"+i+"</span>";
					} else {
						days[m-1][row][col]="<span class='textDate nowDate' data-date='"+s+"' >"+i+"</span>";
					}            	

	                col++;
	                if(col > 6) {
	                      col = 0;
	                      row++;
	                }
	            }
	        }
			
			model.addAttribute("year", year);

			model.addAttribute("todayYear", todayYear);
			model.addAttribute("today", today);
			model.addAttribute("days", days);			
		} catch (Exception e) {
		}
		
		return "concert/year";
	}
	
	@RequestMapping(value = "/concert/article", method = RequestMethod.GET)
	public String article() {
		return ".concert.article";
	}
	
	@RequestMapping(value = "/concert/info", method = RequestMethod.GET)
	public String info() {
		return ".concert.info";
	}
}
