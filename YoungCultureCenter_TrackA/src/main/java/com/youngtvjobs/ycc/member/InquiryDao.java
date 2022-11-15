package com.youngtvjobs.ycc.member;

import java.util.Date;

public interface InquiryDao {
	InquiryDto inqSelectPage(Date startDate, Date endDate) throws Exception;
	
}
