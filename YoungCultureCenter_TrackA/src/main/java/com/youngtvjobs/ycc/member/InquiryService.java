package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

public interface InquiryService {
	
	List<InquiryDto> getPage(String id, String settedInterval,InqPageResolver pr) throws Exception;
	int getPageCnt(String id, String settedInterval,InqPageResolver pr)throws Exception;
	
	List<InquiryDto> getPageByInput(String id, Date startDate, Date endDate,InqPageResolver pr) throws Exception;
	int getPageByInputCnt(String id, Date startDate, Date endDate,InqPageResolver pr) throws Exception;
	
	int wirteInq(InquiryDto inquiryDto) throws Exception;
	InquiryDto read(String id, Integer inq_id);
	
	

}
