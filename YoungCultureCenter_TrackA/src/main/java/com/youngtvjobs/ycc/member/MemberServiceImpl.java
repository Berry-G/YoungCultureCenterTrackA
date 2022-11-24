package com.youngtvjobs.ycc.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.youngtvjobs.ycc.member.mail.MailHandler;
import com.youngtvjobs.ycc.member.mail.TempKey;

@Service
public class MemberServiceImpl implements MemberService{



	@Autowired
	MemberDao memberDao;
	@Autowired
	JavaMailSender mailSender;
	
	public void insertMember(MemberDto memberDto) throws Exception{
		//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
		String mail_key = new TempKey().getKey(30, false);	//랜덤키 길이 설정
		memberDto.setMail_key(mail_key);
		
		//회원가입
		memberDao.signinMember(memberDto);
		memberDao.updateMailKey(memberDto);
		
		//회원가입 완료하면 인증을 위한 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Young문화체육센터 인증메일 입니다.]"); 	//메일제목
		sendMail.setText(
				"<h1>Young문화체육센터 메일인증</h1>" +
				"<br>Young문화체육센터에 오신것을 환영합니다!" +
				"<br>아래 [이메일 인증 확인]을 눌러주세요." +
				"<br><a href='http://localhost:8080/ycc/login/registerEmail?email=" + memberDto.getUser_email() + 
				"&mail_key=" + mail_key +
				"'target ='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("soojeontest01@gmail.com", "Young문화체육센터");
		sendMail.setTo(memberDto.getUser_email());
		sendMail.send();
			
	}

	@Override	//회원 가입
	public void signinMember(MemberDto dto) throws Exception {
		memberDao.signinMember(dto);
	}
	@Override	//아이디체크 
	public int idCheck(MemberDto dto) throws Exception {
		return memberDao.idCheck(dto);
	}

	@Override	//회원 탈퇴
	public int withdraw(String id) throws Exception {
		
		return memberDao.delete(id);
	}

	@Override	//회원 정보 수정
	public int ModifyMemberInfo(MemberDto memberDto) throws Exception {

		return memberDao.update(memberDto);
	}
	
	//	이메일 인증
	@Override
	public int updateMailKey(MemberDto memberDto) throws Exception {
		
		return memberDao.updateMailKey(memberDto);
	}
	@Override
	public int updateMailAuth(MemberDto memberDto) throws Exception {
		
		return memberDao.updateMailAuth(memberDto);
	}
	@Override
	public int emailAuthFail(String id) throws Exception {
		
		return memberDao.emailAuthFail(id);
	}

	
	
}