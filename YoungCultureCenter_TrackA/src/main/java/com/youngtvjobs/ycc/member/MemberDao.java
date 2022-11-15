package com.youngtvjobs.ycc.member;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao
{
	MemberDto loginSelect(String id) throws Exception ;
	
	//회원가입 insert 
	void signinMember(MemberDto dto) throws Exception;

	
	
	int insertUser(MemberDto user) throws Exception;
	
	int deleteUser(String id) throws Exception;
	int deleteAll() throws Exception;
	
	int updateUser(MemberDto user) throws Exception;
}
