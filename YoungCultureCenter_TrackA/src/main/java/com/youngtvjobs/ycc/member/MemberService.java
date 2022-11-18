package com.youngtvjobs.ycc.member;

public interface MemberService {
	//회원가입
	void signinMember(MemberDto dto) throws Exception;
	//회원탈퇴
	int withdraw(String id) throws Exception;
	//회원정보수정
	int ModifyMemberInfo(MemberDto dto) throws Exception;
}