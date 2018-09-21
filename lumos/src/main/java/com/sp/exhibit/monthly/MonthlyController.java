package com.sp.exhibit.monthly;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.exhibit.schedule.Schedule;
import com.sp.exhibit.schedule.ScheduleService;

@Controller("exhibit.monthlyController")
public class MonthlyController {
	@Autowired
	private ScheduleService service;
	
	@RequestMapping(value="exhibit/monthly/list")
	public String main(
			@RequestParam(name = "year", defaultValue = "0") int year,
			@RequestParam(name = "month", defaultValue = "0") int month,
			Model model
			) {
		
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
			Map<String, Object> map = new HashMap<>();
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			List<Schedule> list = service.listMonthlySchedule(map);
			
			String s;
			String[][] days = new String[cal.getActualMaximum(Calendar.WEEK_OF_MONTH)][7];

			for (int i = 1; i < week; i++) {
				s = String.format("%04d%02d%02d", syear, smonth, sdate);
				days[0][i - 1] = "<span class='textDate preMonthDate' data-date='" + s + "' >" + sdate + "</span>";
 				sdate++;
			}
			int ss=scal.get(Calendar.DATE);
			for (int i = 1; i < week; i++) {
				s = String.format("%04d%02d%02d", syear, smonth, ss);
 				for (Schedule dto : list) {
					String sd = dto.getExhibitStart().substring(5,10);
					int sd2=Integer.parseInt(sd.replaceAll("-", ""));
					int cn = Integer.parseInt(s.substring(4));
					int sdf=Integer.parseInt(dto.getExhibitStart().replaceAll("-", ""));
					int cnf=Integer.parseInt(s);
							
					String ed = dto.getExhibitEnd().substring(5,10);
					int ed2=Integer.parseInt(ed.replaceAll("-", ""));
					int edf=Integer.parseInt(dto.getExhibitEnd().replaceAll("-", ""));
					
					if (i==1&sdf<cnf&edf/100>cnf/100) {
						for (int j = i-1; j < week; j++) {
							days[0][j] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
								+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
								+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
						}
					} else if (sd2 == cn&edf/100==cnf/100) {
						for (int j = cn ; j <= ed2; j++) {
							days[0][j-sd2+i-1] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
									+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
									+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
						}
					} else if (ed2 == cn &sdf/100<cnf/100) {
						for (int j = cn-i+1; j <= ed2; j++) {
							days[0][j-cn+i-1] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
									+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
									+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
						}
					} else if (sd2 == cn &edf/100>cnf/100) {
						for (int j = i-1; j < week; j++) {
						days[0][j] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
								+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
								+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
						}
					}
				}
 				ss++;
			}
			// year년도 month월 날짜 및 일정 출력
			int row, n = 0;
			int ww=week;
 			jump1: for (row = 0; row < days.length; row++) {
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
 					if (n == cal.getActualMaximum(Calendar.DATE)) {
						week = i + 1;
						break jump1;
					}
				}
				week = 1;
			}
			
			n=0;
 			jump2: for (row = 0; row < days.length; row++) {
				for (int i = ww - 1; i < 7; i++) {
					n++;
					s = String.format("%04d%02d%02d", year, month, n);
 					for (Schedule dto : list) {
						String sd = dto.getExhibitStart().substring(5,10);
						int sd2=Integer.parseInt(sd.replaceAll("-", ""));
						int cn = Integer.parseInt(s.substring(4));
						String ed = dto.getExhibitEnd().substring(5,10);
						int ed2=Integer.parseInt(ed.replaceAll("-", ""));
						
						int sdf=Integer.parseInt(dto.getExhibitStart().replaceAll("-", ""));
						int cnf=Integer.parseInt(s);
						int edf=Integer.parseInt(dto.getExhibitEnd().replaceAll("-", ""));
						
 						if (n==1&sdf<cnf&edf/100>cnf/100) {
							int ii=cal.get(Calendar.DAY_OF_WEEK)-1;
							int rr=0;
							//무한루프(해당 월의 마지막 날에서 break)
							for(int j=cnf/100*100+1;;j++){
 								days[rr][ii]+= "<span class='scheduleSubject' data-date='" + j + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle("+dto.getExhibitNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getExhibitName() + "</span>";
								ii++;
								
								if(ii>6) { 
									ii=0; 
									rr++; 
									if(rr>=days.length) 
										break;
								}
							}
						} else if (sd2 == cn&edf/100==cnf/100) {
							int ii=i;
							int rr=row;
							for(int j=sd2;j<=ed2;j++){
 								days[rr][ii]+= "<span class='scheduleSubject' data-date='" + j + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle("+dto.getExhibitNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getExhibitName() + "</span>";
								ii++;
								
								if(ii>6) { 
									ii=0; 
									rr++; 
									if(rr>=days.length) 
										break;
								}
							}
						} else if (sd2 == cn &edf/100>cnf/100) {
							int ii=i;
							int rr=row;
							//무한루프(해당 월의 마지막 날에서 break)
							for(int j=sd2;;j++){
 								days[rr][ii]+= "<span class='scheduleSubject' data-date='" + j + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle("+dto.getExhibitNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getExhibitName() + "</span>";
								ii++;
								
								
								if(ii>6) { 
									ii=0; 
									rr++; 
									if(rr>=days.length) 
										break;
								}
							}
						} else if (ed2 == cn &sdf/100<cnf/100) {
							int ii=cal.get(Calendar.DAY_OF_WEEK)-1;
							int rr=0;
							for(int j=ed2/100*100+1;j<=ed2;j++){
 								days[rr][ii]+= "<span class='scheduleSubject' data-date='" + j + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle("+dto.getExhibitNum()+")'>"+dto.getHallName()+"&nbsp;&nbsp;"+ dto.getExhibitName() + "</span>";
								ii++;
								
								if(ii>6) { 
									ii=0; 
									rr++; 
									if(rr>=days.length) 
										break;
								}
							}
						}
					}
 					if (n == cal.getActualMaximum(Calendar.DATE)) {
 						ww = i + 1;
						break jump2;
					}
				}
				ww = 1;
			}
			
 			// year년도 month월 마지막 날짜 이후 일정 출력
			if (week != 7) {
				n = 0;
				for (int i = week; i < 7; i++) {
					n++;
					s = String.format("%04d%02d%02d", eyear, emonth, n);
					days[row][i] = "<span class='textDate nextMonthDate' data-date='" + s + "' >" + n + "</span>";
 				}
			}
			
			if (ww != 7) {
				n=0;
				for (int i = ww; i < 7; i++) {
					n++;
					s = String.format("%04d%02d%02d", eyear, emonth, n);
 					for (Schedule dto : list) {
						String sd = dto.getExhibitStart().substring(5,10);
						int sd2=Integer.parseInt(sd.replaceAll("-", ""));
						int cn = Integer.parseInt(s.substring(4));
 						
						int sdf=Integer.parseInt(dto.getExhibitStart().replaceAll("-", ""));
						int cnf=Integer.parseInt(s);
								
						String ed = dto.getExhibitEnd().substring(5,10);
						int ed2=Integer.parseInt(ed.replaceAll("-", ""));
						int edf=Integer.parseInt(dto.getExhibitEnd().replaceAll("-", ""));
						
						if (i==ww&sdf<cnf&edf>cnf) {
							for (int j = ww; j < 7; j++) {
								days[row][j] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
										+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
							}
						} else if (sd2 == cn&edf/100==cnf/100) {
							for (int j = cn ; j <= ed2; j++) {
								days[row][j-sd2+i] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
										+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
							}							
						} else if (ed2 == cn &sdf/100<cnf/100) {
							for (int j = ww; j <= i; j++) {
								days[row][j] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
										+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
										+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
							}
						} else if (sd2 == cn &edf/100>cnf/100) {
							for (int j = i ; j < 7; j++) {
								days[row][j] += "<span class='scheduleSubject' data-date='" + sd2 + "' data-num='"
									+ dto.getExhibitNum() + "' onclick='goArticle(" + dto.getExhibitNum() + ")'>"
									+ dto.getHallName() + "&nbsp;&nbsp;" + dto.getExhibitName() + "</span>";
							}
						} 
					}
 				}
			}

			model.addAttribute("year", year);
			model.addAttribute("month", month);
			model.addAttribute("days", days);
		} catch (Exception e) {
		}

		
		return "/exhibit/monthly/list";
	}
}
