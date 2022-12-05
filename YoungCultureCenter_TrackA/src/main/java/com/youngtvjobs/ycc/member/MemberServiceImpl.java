package com.youngtvjobs.ycc.member;

import java.sql.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String year = dto.getBirthYear();
		String month = dto.getBirthMonth();
		String day = dto.getBirthDay();
		
		Date birth = Date.valueOf(year +"-"+ month +"-"+ day);
		dto.setUser_birth_date(birth);
		
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
	
	//아이디 찾기
	@Override
	public String findId(HttpServletResponse response, String user_email, String user_name) throws Exception {

		String user_id = memberDao.findId(user_email, user_name);
		
		if (user_id == null) {
			return null;
		} else {
			return user_id;
		}
	}
	
	//패스워드 찾기
	@Override
	public String findPw(HttpServletResponse response, String user_id, String user_name) throws Exception {
		
		String user_email = memberDao.findPw(user_id, user_name);
		
		if (user_email == null) {
			return null;
		} else {
			return user_email;
		}
	}
	
	//이메일인증: mail_key값 생성하여 메일 발송세팅
	@Override 
	public String insertMember(String user_email) throws Exception {
		
			//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
			String mail_key = new TempKey().getKey(7, false);	//랜덤키 길이 설정
			
			String mail_title = "[Young문화체육센터 인증메일 입니다.]";
			String mail_text = "<h1>Young문화체육센터 메일인증</h1>" +
					"<br>Young문화체육센터에 오신것을 환영합니다!" +
					"<br>아래 인증번호를 인증번호 입력창에 입력해주세요." +
					"<p><b>인증번호: "+ mail_key +"</b></p>";
			
			this.sendEmail(user_email, mail_title, mail_text);
			
			
			return mail_key;
		}
	
	//패스워드 찾을때 이메일 발송 세팅
	public String pwSendEmail(String user_email) throws Exception {
		
		//랜덤 문자열을 생성해서 pw 컬럼에 넣어주기
		String pw = memberDao.findPword(user_email);
		
		String email_title = "[Young문화체육센터 비밀번호 입니다.]";
		String email_text = "<h1>Young문화체육센터 비밀번호 찾기</h1>" +
				"<p><b>비밀 번호 : "+ pw +"</b></p>";
		
		this.sendEmail(user_email, email_title, email_text);
		
		return user_email;
		
	}
	
	//이메일 발송 함수
	public void sendEmail(String user_email, String email_title, String email_text) throws Exception {
		//회원가입 완료하면 인증을 위한 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject(email_title); 	//메일제목
		sendMail.setText(email_text);
		sendMail.setFrom("soojeontest01@gmail.com", "Young문화체육센터");
		sendMail.setTo(user_email);
		sendMail.send();
	}

	
	
}