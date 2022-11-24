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
	
	//이메일인증: mail_key값 생성하여 메일 발송해줌
	@Override 
	public String insertMember(String user_email) throws Exception {
		
			//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
			String mail_key = new TempKey().getKey(7, false);	//랜덤키 길이 설정
			
			//회원가입 완료하면 인증을 위한 이메일 발송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Young문화체육센터 인증메일 입니다.]"); 	//메일제목
			sendMail.setText(
					"<h1>Young문화체육센터 메일인증</h1>" +
					"<br>Young문화체육센터에 오신것을 환영합니다!" +
					"<br>아래 인증번호를 인증번호 입력창에 입력해주세요." +
					"<p><b>인증번호: "+ mail_key +"</b></p>");
			sendMail.setFrom("soojeontest01@gmail.com", "Young문화체육센터");
			System.out.println(user_email);
			sendMail.setTo(user_email);
			sendMail.send();
			
			return mail_key;
		}
	@Override
	public int updateMailKey(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateMailAuth(MemberDto memberDto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int emailAuthFail(String id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}

	
