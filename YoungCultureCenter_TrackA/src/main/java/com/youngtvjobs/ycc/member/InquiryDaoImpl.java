package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace= "com.youngtvjobs.ycc.member.inquiryMapper.";

	@Override
	public InquiryDto inqSelectPage(Date startDate, Date endDate) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InquiryDto> selectPage(String id) throws Exception {
		
		return session.selectList(namespace+"selectPage" , id);	
	}


}
