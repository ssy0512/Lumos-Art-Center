package com.sp.exhibit.schedule;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service("schedule.dateUtil")
public class DateUtil {
	/**
	 * String형 날짜를 Date형으로 변환하는 메소드
	 * 
	 * @param dateStr 변환할 날짜
	 * @return 날짜
	 */
	public Date toDate(String dateStr) {
		Date date=null;
		
		try {
			if (dateStr.length() != 8 && dateStr.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + dateStr);
			}

			dateStr = dateStr.replaceAll("(-|\\.|/)", "");
			
			SimpleDateFormat sformat = new SimpleDateFormat("yyyyMMdd");
			date = sformat.parse(dateStr);
			
		} catch (ParseException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return date;
	}

	/**
	 * Date형을 String형으로 변환하는 메소드
	 * 
	 * @param date 변환할 날짜
	 * @return 변환된 문자열
	 */
	public String toString(Date date) {
		String str=null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        str = sdf.format(date);
		
		return str;
	}

	/**
	 * 현재날짜를 String형으로 변환하는 메소드
	 * 
	 * @return 현재날짜 문자열(yyyy-MM-dd)
	 */
	public String syadateToString() {
		Calendar now = Calendar.getInstance();

		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		
		String str = String.format("%4d-%02d-%02d", year, month, day);
		
		return str;
	}

	/**
	 * 기준 날짜로부터 지난주 일요일 날짜 구하기
	 * 
	 * @return 지난주 일요일 문자열(yyyy-MM-dd)
	 */
	public String lastSun(String inputdate) {
		String en=toWeekStart(toDaysLater(inputdate,-7));
		
		
		return en;
	}

	/**
	 * 기준 날짜로부터 지난주 토요일 날짜 구하기
	 * 
	 * @return 지난주 토요일 문자열(yyyy-MM-dd)
	 */
	public String lastSat(String inputdate) {
		String sun=toWeekEnd(toDaysLater(inputdate,-7));
		return sun;
	}
	
	/**
	 * 기준 날짜로부터 다음주 시작일 (일요일) 날짜 구하기
	 * 
	 * @return 지난주 일요일 문자열(yyyy-MM-dd)
	 */
	public String nextWeekStart(String inputdate) {
		String st=toWeekStart(toDaysLater(inputdate,7));
		
		
		return st;
	}

	/**
	 * 기준 날짜로부터 다음주 마지막일 (토요일) 날짜 구하기
	 * 
	 * @return 지난주 토요일 문자열(yyyy-MM-dd)
	 */
	public String nextWeekEnd(String inputdate) {
		String end=toWeekEnd(toDaysLater(inputdate,7));
		return end;
	}
	
	/**
	 * 생년월일을 이용하여 나이를 계산하는 메소드
	 * 
	 * @param birth 나이를 계산할 생년월일(yyyyMMdd)
	 * @return 나이
	 */
	public int toAge(String birth) {
		int age = 0;

		try {
			if (birth.length() != 8 && birth.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + birth);
			}

			String dateStr = birth;
			if (birth.length() == 10) {
				dateStr = birth.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar now = Calendar.getInstance();

			age = now.get(Calendar.YEAR) - cal.get(Calendar.YEAR);
			if ((cal.get(Calendar.MONTH) > now.get(Calendar.MONTH))
					|| (cal.get(Calendar.MONTH) == now.get(Calendar.MONTH)
							&& cal.get(Calendar.DAY_OF_MONTH) > now.get(Calendar.DAY_OF_MONTH))) {
				age--;
			}

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return age;
	}

	/**
	 * 기준날짜의 며칠째 되는 날을 구하는 메소드
	 * 
	 * @param date 기준날짜
	 * @param days 며칠째 되는 날을 계산할 일자
	 * @return     며칠후의 날짜(yyyy-MM-dd)
	 */
	public String toDaysLater(String date, int days) {
		String result = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6, 8));

			Calendar cal = Calendar.getInstance();
			cal.set(year, month - 1, day);
			cal.add(Calendar.DATE, days);

			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
			day = cal.get(Calendar.DATE);

			result = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}
	
	public String toMonthsLater(String date, int months) {
		String result = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6, 8));

			Calendar cal = Calendar.getInstance();
			cal.set(year, month - 1, day);
			cal.add(Calendar.MONTH, months);

			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
			day = cal.get(Calendar.DATE);

			result = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	/**
	 * 한 주의 시작일(일요일)을 구하는 메소드
	 * 
	 * @param date 기준날짜
	 * @return     한 주의 시작일자(yyyy-MM-dd)
	 */
	public String toWeekStart(String date) {
		String s = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar sday = (Calendar) cal.clone();
			int t = cal.get(Calendar.DAY_OF_WEEK) - 1;
			sday.add(Calendar.DAY_OF_MONTH, t * -1);

			year = sday.get(Calendar.YEAR);
			month = sday.get(Calendar.MONTH) + 1;
			day = sday.get(Calendar.DATE);

			s = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return s;
	}

	/**
	 * 한 주의 마지막일(토요일)을 구하는 메소드
	 * 
	 * @param date 기준날짜
	 * @return     한 주의 마지막일자(yyyy-MM-dd)
	 */
	public String toWeekEnd(String date) {
		String s = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar eday = (Calendar) cal.clone();
			int t = 7 - cal.get(Calendar.DAY_OF_WEEK);
			eday.add(Calendar.DAY_OF_MONTH, t);

			year = eday.get(Calendar.YEAR);
			month = eday.get(Calendar.MONTH) + 1;
			day = eday.get(Calendar.DATE);

			s = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return s;
	}

	
	/**
	 * 해당년도의 띠를 구하는 메소드
	 * 
	 * @param year 띠를 구할 연도
	 * @return     띠
	 */
	public String toTti(int year) {
		String t[] = { "원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양" };
		return t[year % 12];
	}

	/**
	 * 윤년인지 판별하는 메소드
	 * 
	 * @param year
	 * @return
	 */
	public boolean isLeapYear(int year) {
		return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
	}

	/**
	 * 두 날짜 사이의 차이를 일자로 리턴하는 메소드
	 * 
	 * @param sDate  차이를 계산할 시작날짜
	 * @param eDate  차이를 계산할 시작날짜
	 * @return       날짜사이의 차이(일자)
	 */
	public int diffDays(String startDate, String endDate) {
		int result = 0;

		try {
			if (startDate.length() != 8 && startDate.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + startDate);
			}
			if (endDate.length() != 8 && endDate.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + endDate);
			}

			startDate = startDate.replaceAll("(-|\\.|/)", "");
			endDate = endDate.replaceAll("(-|\\.|/)", "");

			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Date date1 = format.parse(startDate);
			Date date2 = format.parse(endDate);

			long d = date2.getTime() - date1.getTime();

			result = (int) (d / (1000 * 60 * 60 * 24));

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}
	
	/**
	 * 날짜가 올바른 형식인지를 리턴하는 메소드(올바르면 true)
	 * 
	 * @param date  형식을 알어볼 날짜
	 * @return      
	 */
	public boolean isDateCheck(String date) {
		try {
			if (date.length() != 8 && date.length() != 10) {
				return false;
			}

			date = date.replaceAll("(-|\\.|/)", "");
			int year = Integer.parseInt(date.substring(0, 4));
			int month = Integer.parseInt(date.substring(4, 6));
			int day = Integer.parseInt(date.substring(6));
			
			if(month<1||month>12)
				return false;
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			
			int lastDay=cal.getActualMaximum(Calendar.DATE);
			if(day<1||day>lastDay)
				return false;

		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	/**
	 * 주민번호가 올바른 형식인지를 리턴하는 메소드(올바르면 true)
	 * 
	 * @param rrn  주민번호
	 * @return      
	 */
	public boolean isRrnCheck(String rrn) {
		int [] check = {2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5};
		int tot, n, lastNum, chkNum;
		boolean b=false;
		
		try {
			if (rrn.length() != 14 && rrn.length() != 13) {
				return false;
			}
			
			if(toBirth(rrn).length()==0) {
				return false;
			}

			rrn = rrn.replaceAll("-", "");

			tot=0;
			for(int i = 0; i < 12; i++) {
				n = Integer.parseInt(rrn.substring(i, i+1));

				tot = tot+(n * check[i]);
			}

			lastNum = Integer.parseInt(rrn.substring(12));
			chkNum = 11 - tot % 11;
			chkNum = chkNum % 10;
			
			b=lastNum == chkNum;
			
		} catch (Exception e) {
			return false;
		}

		return b;
	}
	
	/**
	 * 주민번호를 이용하여 생년월일을 리턴하는 메소드
	 * 
	 * @param rrn  주민번호
	 * @return     생년월일
	 */
	public String toBirth(String rrn) {
		String birth="";
		int gender;
		
		try {
			if (rrn.length() != 14 && rrn.length() != 13) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
			
			rrn = rrn.replaceAll("-", "");
			gender=Integer.parseInt(rrn.substring(6,7));
			
			// birth=rrn.substring(0, 6);
			birth=rrn.substring(0, 2)+"-"+rrn.substring(2, 4)+"-"+rrn.substring(4, 6);
			if(gender==1||gender==2||gender==5||gender==6) {
				birth="19"+birth;
			} else if(gender==3||gender==4||gender==7||gender==8) {
				birth="20"+birth;
			} else if(gender==0||gender==9) {
				birth="18"+birth;
			}
			
			if(! isDateCheck(birth)) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return birth;
	}
	
	/**
	 * 주민번호를 이용하여 성별을 리턴하는 메소드
	 * 
	 * @param rrn  주민번호
	 * @return     성별
	 */
	public String toGender(String rrn) {
		String gender="";
		int s;
		
		try {
			if (isRrnCheck(rrn)) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
			
			rrn = rrn.replaceAll("-", "");
			s=Integer.parseInt(rrn.substring(6,7));
			
			gender="남자";
			if(s%2==0)
				gender="여자";
			
		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return gender;
	}

}
