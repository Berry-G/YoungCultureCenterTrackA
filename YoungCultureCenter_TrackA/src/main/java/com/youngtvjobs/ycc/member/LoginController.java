package com.youngtvjobs.ycc.member;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@Autowired
	MemberDao memberDao;
	
	@Autowired(required=false)
	MemberDto user;

	@GetMapping("/login")
	public String login() {
		return "member/loginForm";
	}

	@PostMapping("/login")
	public String login(String id, String pw, String toURL, boolean save_id, boolean autoLogin,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		//id, 비밀번호 일치하지 않을 시 메서드 종료
		if (!loginCheck(id, pw))
		{
			String msg = URLEncoder.encode("ID 또는 PW가 일치하지 않습니다.", "utf-8");
			return "redirect:/login?msg=" + msg;
		}
		
		//user 객체에 id로 조회해서 나온 DB 튜플을 저장
		user = memberDao.loginSelect(id);
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		//세션에 필요한 데이터 저장
		session.setAttribute("id", id);
		session.setAttribute("name", user.getUser_name());
		session.setAttribute("grade", user.getUser_grade());
		//세선 속 데이터 체크 로깅
		System.out.println("아이디 : " + session.getAttribute("id"));
		System.out.println("이름 : " + session.getAttribute("name"));
		System.out.println("회원등급 : " + session.getAttribute("grade"));

		// 아이디 저장 체크박스
		// True: 아이디가 저장된 쿠키 생성 후 response객체에 쿠키저장
		if (save_id) {
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		// 자동로그인 체크박스
		// 세션(SESSIONID)을 쿠키에 담아서 30일간 저장
		if (autoLogin) {
			Cookie cookie = new Cookie("autoLogin", session.getId());
			cookie.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(cookie);
		}
		
		//자동로그인 부분
		if(session.getAttribute("autoLogin")!=null) {
		}

		
		toURL = toURL == null || toURL.equals("") ? "/" : toURL;
		return "redirect:" + toURL;
	}

	private boolean loginCheck(String id, String pw) throws Exception {
		user = memberDao.loginSelect(id);
		
		//db에서 id검색이 되지 않아 user 객체가 생성되지 않으면  로그인 실패 
		if(user == null) {return false;}
		
		return user.getUser_pw().equals(pw);
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션을 종료
		session.invalidate();
		// 홈으로 이동
		return "redirect:/";
	}
}