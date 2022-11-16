package com.youngtvjobs.ycc.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{



	@Autowired
	MemberDao memberDao;

	@Override
	public void signinMember(MemberDto dto) throws Exception {
		memberDao.signinMember(dto);


	}

}