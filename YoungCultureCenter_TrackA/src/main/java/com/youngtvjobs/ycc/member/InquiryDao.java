package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

public interface InquiryDao {

	InquiryDto inqSelectPage(Date startDate, Date endDate) throws Exception;
	
	List<InquiryDto> selectPage(String id) throws Exception;
		

}
