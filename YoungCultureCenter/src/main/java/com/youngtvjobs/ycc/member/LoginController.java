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
public class LoginController
{
	@Autowired
	MemberDao memberDao;
	
	//로그인
	@GetMapping("/login")
	public String login()	{
		return "member/loginForm";
	}
	@PostMapping("/login")
	public String login(String id, String pw, String toURL, boolean save_id,
						HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!logincheck(id, pw)) {
			String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8"); 
			return "redirect:/login?msg="+msg;
		}
		if(save_id) {
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		System.out.println(session.getAttribute("id"));
		
		toURL = toURL==null || toURL.equals("") ? "/" : toURL;
		return "redirect:" + toURL;
	}
	
	private boolean logincheck(String id, String pw) throws Exception
	{
		// TODO Auto-generated method stub
		MemberDto user = memberDao.loginSelect(id);
		System.out.println(user.getUser_pw());
		System.out.println(pw);
		if(user == null) 
			return false;
		
		System.out.println(user.getUser_pw().equals(pw));
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
