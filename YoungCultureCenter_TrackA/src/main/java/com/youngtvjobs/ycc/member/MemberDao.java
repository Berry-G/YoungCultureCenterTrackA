package com.youngtvjobs.ycc.member;

public interface MemberDao
{
	MemberDto loginSelect(String id) throws Exception ;
	
	int insertUser(MemberDto user) throws Exception;
	
	int deleteUser(String id) throws Exception;
	int deleteAll() throws Exception;
	
	int updateUser(MemberDto user) throws Exception;
}
