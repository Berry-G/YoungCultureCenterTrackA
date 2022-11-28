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
	
	//기간 직접입력 조회
	@Override
	public List<InquiryDto> selectPageByInput(String id, Date startDate, Date endDate, InqPageResolver pr) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("pageSize", pr.getPageSize());
		map.put("offset",pr.getOffset());
		return session.selectList(namespace+"selectPageByInput", map);
	}

	@Override
	public int selectPageByInputCnt(String id, Date startDate, Date endDate, InqPageResolver pr) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("pageSize", pr.getPageSize());
		map.put("offset",pr.getOffset());
		return session.selectOne(namespace +"selectPageByInputCnt", map);
	}
	
	//설정된 기간(버튼) 조회
	@Override
	public List<InquiryDto> selectPage(String id, String settedInterval, InqPageResolver pr) throws Exception {
			Map map = new HashMap();
			map.put("id", id);
			map.put("settedInterval", settedInterval);
			map.put("pageSize", pr.getPageSize());
			map.put("offset",pr.getOffset());
		return session.selectList(namespace+"selectPage" ,map);	
	}
	@Override
	public int selectPageCnt(String id, String settedInterval, InqPageResolver pr) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("settedInterval", settedInterval);
		map.put("pageSize", pr.getPageSize());
		map.put("offset",pr.getOffset());
		
		System.out.println("dao오프셋 : " + pr.getOffset());

		return session.selectOne(namespace+"selectPageCnt", map);
	}

	//문의글 작성
	@Override
	public int insert(InquiryDto inquiryDto) throws Exception {

		return session.insert(namespace+"insert", inquiryDto);
	}

	@Override
	public InquiryDto select(String id, Integer inq_id) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("inq_id", inq_id);
		return session.selectOne(namespace+"select" , map);
	}





}
