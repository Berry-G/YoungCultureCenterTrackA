package com.youngtvjobs.ycc.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao
{
	@Autowired
	private SqlSession session;
	private static String namespace = "com.youngtvjobs.ycc.member.memberMapper.";
	MemberDto memberDto;
	JavaMailSender mailSender;
	

	@Override
	public MemberDto loginSelect(String id) throws Exception
	{
		// 로그인 셀렉트 
		return session.selectOne(namespace + "loginSelect", id);
	}
	
	
	//회원가입_아이디중복체크 
		@Override
		public int idCheck(MemberDto dto) throws Exception {
			
			return session.selectOne(namespace + "idCheck", dto);
		}

		
	//회원가입_INSERT
	@Override
	public void signinMember(MemberDto dto) throws Exception {

		session.insert(namespace + "signinMember" , dto);
		
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

	//아이디 찾기
	@Override
	public String findId(String user_email, String user_name) throws Exception {
		Map map = new HashMap();
		map.put("user_email", user_email);
		map.put("user_name", user_name);
		
		return session.selectOne(namespace + "findId", map);
	}
	
	//패스워드 찾기
	@Override
	public String findPw(String user_id, String user_name) throws Exception {
		Map map = new HashMap();
		map.put("user_id", user_id);
		map.put("user_name", user_name);
		return session.selectOne(namespace + "findPw", map);
	}
	
	//패스워드 이메일로 발송
	public String findPword(String user_email) throws Exception {
		
		return session.selectOne(namespace + "findPword", user_email);
	}





}
