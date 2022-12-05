package com.youngtvjobs.ycc.member;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	//회원가입
	void signinMember(MemberDto dto) throws Exception;
	//회원가입 아이디체크 
	int idCheck(MemberDto dto) throws Exception;
	//회원탈퇴
	int withdraw(String id) throws Exception;
	//회원정보수정
	int ModifyMemberInfo(MemberDto dto) throws Exception;
	
	//id,pw 찾기
	String findId(HttpServletResponse response, String user_email, String user_name) throws Exception;
	String findPw(HttpServletResponse response, String user_id, String user_name) throws Exception;
		
	//이메일 인증
	String insertMember(String user_email) throws Exception;
	String pwSendEmail(String user_id) throws Exception;
}