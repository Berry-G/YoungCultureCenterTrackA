package com.youngtvjobs.ycc.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao
{
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.member.memberMapper.";
	

	@Override
	public MemberDto loginSelect(String id) throws Exception
	{
		// 로그인 셀렉트 
		return session.selectOne(namespace + "loginSelect", id);
	}
	
	
	
	
	
	
	
	
	
	
	@Override
	public void deleteAll() throws Exception
	{
		// TODO Auto-generated method stub
		
	}
	@Override
	public int insertUser(MemberDto user) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateUser(MemberDto user) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}



}
