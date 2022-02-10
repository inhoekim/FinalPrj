package com.spring.ott.util;

import java.sql.Date;
import java.util.Calendar;

public class CalendarUtil {
	public static int getDiffDay(Date date) {
		Calendar today = Calendar.getInstance();
		Calendar targetDay = Calendar.getInstance();
		targetDay.setTime(date);		
		long diffSec = (targetDay.getTimeInMillis() - today.getTimeInMillis()) / 1000;
		long diffDay = diffSec / (24*60*60);		
		return (int) diffDay;			
	}
	
	public static int getFees(int day) {
		int fees = -1;
		if(1 <= day && day <= 10) {
			fees = 0;
		}else if(1 <= day && day <= 20) {
			fees = 490;
		}else {
			fees = 990;
		}
		return fees;
	}
}
