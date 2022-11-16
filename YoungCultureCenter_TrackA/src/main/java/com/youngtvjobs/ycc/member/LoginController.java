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

	@GetMapping("/login")
	public String login() {
		return "member/loginForm";
	}

	@PostMapping("/login")
	public String login(String id, String pw, String toURL, boolean save_id, boolean autoLogin,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

//		if(!loginCheck(id, pw)) {
//		String msg= URLEncoder.encode("ID 또는 PW가 일치하지 않습니다.", "utf-8");
//		return "redirect:/login?msg=" +msg;
//		}
		
		//세션 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("autoLogin")!=null) {
		
		}

		// 로그인 체크 (id와 비밀번호 비교확인)
		MemberDto user = memberDao.loginSelect(id);
		System.out.println(id);
		System.out.println(pw);

		// db에서 id검색이 되지 않아 user 객체가 생성되지 않거나, pw가 일치하지 않으면 로그인 실패
		if (user == null || !(user.getUser_pw().equals(pw))) {
			String msg = URLEncoder.encode("ID 또는 PW가 일치하지 않습니다.", "utf-8");
			return "redirect:/login?msg=" + msg;
		}

		// 로그인 성공시 id 저장 (다른 곳에서 받아올 때 세션에 저장된 "id"값을 받아올 수 있음
		session.setAttribute("id", id);


		System.out.println("getAttribute=" +session.getAttribute("id"));
		System.out.println("getId=" +session.getId());

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

		toURL = toURL == null || toURL.equals("") ? "/" : toURL;
		return "redirect:" + toURL;
	}

//	private boolean loginCheck(String id, String pw) throws Exception {
//		MemberDto user = memberDao.loginSelect(id);
//		System.out.println(user.getUser_pw());
//		System.out.println(pw);
//		
//		//db에서 id검색이 되지 않아 user 객체가 생성되지 않으면  로그인 실패 
//		if(user == null) {return false;}
//		
//		return user.getUser_pw().equals(pw);
//	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션을 종료
		session.invalidate();
		// 홈으로 이동
		return "redirect:/";
	}
}