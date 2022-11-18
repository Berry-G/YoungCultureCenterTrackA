package com.youngtvjobs.ycc.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{



	@Autowired
	MemberDao memberDao;

	@Override	//회원 가입
	public void signinMember(MemberDto dto) throws Exception {
		memberDao.signinMember(dto);

		
	}

	@Override	//회원 탈퇴
	public int withdraw(String id) throws Exception {
		
		return memberDao.delete(id);
	}

	@Override	//회원 정보 수정
	public int ModifyMemberInfo(MemberDto memberDto) throws Exception {

		return memberDao.update(memberDto);
	}

	
	
}