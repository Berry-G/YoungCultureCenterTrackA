package com.youngtvjobs.ycc.member;

import java.sql.Date;

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
		
		//String -> Date 변경
		String year = dto.getBirthYear();
		String month = dto.getBirthMonth();
		String day = dto.getBirthDay();
		
		Date birth = Date.valueOf(year+"-"+month+"-"+day);
		dto.setUser_birth_date(birth);
		
		session.insert(namespace + "signinMember", dto);
		
	}

	@Override
	public int update(MemberDto memberDto) throws Exception
	{
		// 회원 정보 수정
		return session.update(namespace+"update", memberDto);
	}


	@Override
	public int delete(String id) throws Exception {
		//회원 탈퇴
		return session.delete(namespace+"delete", id);
	}
	@Override
	public int deleteAll() throws Exception
	{
		return session.delete(namespace+"deleteAll");
		
	}







}
