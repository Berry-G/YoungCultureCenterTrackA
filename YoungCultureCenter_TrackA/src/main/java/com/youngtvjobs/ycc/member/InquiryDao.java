package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface InquiryDao {

	List<InquiryDto> selectPageByInput(String id,Date startDate, Date endDate) throws Exception;
	
	List<InquiryDto> selectPage(String id, String settedInterval) throws Exception;

	

}
