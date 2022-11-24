package com.youngtvjobs.ycc.member;

import java.util.List;

public interface InquiryService {
	
	List<InquiryDto> getPage(String id, String settedInterval) throws Exception;

}
