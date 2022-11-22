package com.youngtvjobs.ycc.member;

import java.util.Date;

public class SearchPeriod {
	
	
	//오늘 날짜
	final static Date todayDate = new Date();
	
	//6개월 전 날짜
	public static final long DEFAULT_START_DATE = todayDate.getTime()-(182 * 24 * 60 * 60 * 1000);
	public static final long DEFAULT_END_DATE = todayDate.getTime(); 
	
	
	private java.sql.Date startDate;
	private java.sql.Date endDate;

	
	
	public SearchPeriod() {
	// TODO Auto-generated constructor stub
	}
	
	
}

