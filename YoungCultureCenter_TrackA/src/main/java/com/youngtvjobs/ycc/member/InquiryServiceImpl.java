package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	InquiryDao inquiryDao;
	
	@Override
	public List<InquiryDto> getPage(String id, String settedInterval) throws Exception {

		return inquiryDao.selectPage(id,settedInterval);
	}

	@Override
	public List<InquiryDto> getPageByInput(String id, Date startDate, Date endDate) throws Exception {

		return inquiryDao.selectPageByInput(id, startDate, endDate);
	}

	

}
