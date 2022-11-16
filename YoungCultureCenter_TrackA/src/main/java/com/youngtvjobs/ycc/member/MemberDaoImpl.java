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
	public void signinMember(MemberDto dto) throws Exception {
		
		session.insert(namespace + "signinMember", dto);
		
	}

	@Override
	public int insertUser(MemberDto user) throws Exception
	{
		// 유저 추가
		return 0;
	}
	@Override
	public int updateUser(MemberDto user) throws Exception
	{
		// 회원 정보 수정
		return session.update(namespace+"updateUser", user);
	}


	@Override
	public int deleteUser(String id) throws Exception {
		//회원 탈퇴
		return session.delete(namespace+"deleteUser", id);
	}
	@Override
	public int deleteAll() throws Exception
	{
		return session.delete(namespace+"deleteAll");
		
	}







}
