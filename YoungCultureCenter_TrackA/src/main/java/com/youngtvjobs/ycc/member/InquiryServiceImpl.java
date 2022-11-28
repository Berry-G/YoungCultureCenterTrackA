package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	InquiryDao inquiryDao;
	//설정된 기간(버튼) 조회
	@Override
	public List<InquiryDto> getPage(String id, String settedInterval ,InqPageResolver pr) throws Exception {

		return inquiryDao.selectPage(id,settedInterval,pr);
	}
	@Override
	public int getPageCnt(String id, String settedInterval, InqPageResolver pr) throws Exception {
		System.out.println("service오프셋 : " + pr.getOffset());
		return inquiryDao.selectPageCnt(id, settedInterval,pr);
	}
	//기간 직접입력 조회
	@Override
	public List<InquiryDto> getPageByInput(String id, Date startDate, Date endDate, InqPageResolver pr) throws Exception {

		return inquiryDao.selectPageByInput(id, startDate, endDate, pr);
	}
	@Override
	public int getPageByInputCnt(String id, Date startDate, Date endDate, InqPageResolver pr) throws Exception {
		return inquiryDao.selectPageByInputCnt(id, startDate, endDate, pr);
	}
	//문의글 쓰기
	@Override
	public int wirteInq(InquiryDto inquiryDto) throws Exception {

		return inquiryDao.insert(inquiryDto);
	}
	//문의글 읽기
	@Override
	public InquiryDto read(String id, Integer inq_id) {

		return inquiryDao.select(id, inq_id);
	}





	

}
