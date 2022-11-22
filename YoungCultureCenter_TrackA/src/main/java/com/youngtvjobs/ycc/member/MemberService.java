package com.youngtvjobs.ycc.member;

public interface MemberService {
	//회원가입
	void signinMember(MemberDto dto) throws Exception;
	//회원가입 아이디체크 
	int idCheck(MemberDto dto) throws Exception;
	//회원탈퇴
	int withdraw(String id) throws Exception;
	//회원정보수정
	int ModifyMemberInfo(MemberDto dto) throws Exception;
	
	//이메일 인증
	int updateMailKey(MemberDto memberDto) throws Exception;
	int updateMailAuth(MemberDto memberDto) throws Exception;
	int emailAuthFail(String id) throws Exception;
	String insertMember(String user_email) throws Exception;
}