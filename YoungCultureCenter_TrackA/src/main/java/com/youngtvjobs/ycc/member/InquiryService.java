package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

public interface InquiryService {
	
	List<InquiryDto> getPage(String id, String settedInterval) throws Exception;
	
	List<InquiryDto> getPageByInput(String id, Date startDate, Date endDate) throws Exception;
	
	

}
