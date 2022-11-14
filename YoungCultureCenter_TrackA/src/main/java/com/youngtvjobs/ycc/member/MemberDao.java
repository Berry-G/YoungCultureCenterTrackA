package com.youngtvjobs.ycc.member;

public interface MemberDao
{
	MemberDto loginSelect(String id) throws Exception ;
	void deleteAll() throws Exception;
	int insertUser(MemberDto user) throws Exception;
	int updateUser(MemberDto user) throws Exception;
}
