package com.youngtvjobs.ycc.member;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao
{
	MemberDto loginSelect(String id) throws Exception ;
	
	//회원가입 insert 
		void signinMember(MemberDto dto) throws Exception;

	//회원가입 아이디중복체크
	int idCheck(MemberDto dto) throws Exception;
	
	int delete(String id) throws Exception;
	int deleteAll() throws Exception;
	
	//회원 정보 수정
	int update(MemberDto memberDto) throws Exception;
	
	//아이디 찾기
	String findId(String user_email, String user_name) throws Exception;
	
	//패스워드 찾기
	String findPw(String user_id, String user_name) throws Exception;
	//패스워드 이메일로 발송
	String findPword(String user_email) throws Exception;
}
