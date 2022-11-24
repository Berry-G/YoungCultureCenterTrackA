package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	private SqlSession session;
	private static String namespace= "com.youngtvjobs.ycc.member.inquiryMapper.";

	@Override
	public InquiryDto inqSelectPage(String id, Date startDate, Date endDate) throws Exception {

		return null;
	}

	@Override
	public List<InquiryDto> selectPage(String id, String settedInterval) throws Exception {
			Map map = new HashMap();
			map.put("id", id);
			map.put("settedInterval", settedInterval);
			
		return session.selectList(namespace+"selectPage" ,map);	
	}



}
