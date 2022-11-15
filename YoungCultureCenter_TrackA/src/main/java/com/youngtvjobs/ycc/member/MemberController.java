package com.youngtvjobs.ycc.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//회원관리 컨트롤러
@Controller
public class MemberController {

	@Autowired
	MemberDao memberDao;
	
	//회원약관동의
	@RequestMapping("/member/signin1")
	public String joincheck() {
		return "member/signin1";
	}
	//회원가입
	@RequestMapping("/member/signin2")
	public String joinmember()	{
		return "member/signin2";
	}
	//회원가입 결과
	@RequestMapping("/member/signin3")
	public String joinresult()	{
		return "member/signin3";
	}

	/*
	 * //로그인
	 * 
	 * @RequestMapping("/login") public String login() { return "member/loginForm";
	 * }
	 */
	
	//마이페이지1 : 본인인증
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage1(HttpSession session)	{
		
		return "member/mypage1";
	}
	@RequestMapping(value="/mypage", method=RequestMethod.POST)
	public String mypage1(String inputPassword, HttpSession session) throws Exception	{
		
		System.out.println(inputPassword);
		MemberDto memberDto = memberDao.loginSelect((String)session.getAttribute("id"));
		if(!memberDto.getUser_pw().equals(inputPassword)){
			return "redirect:/mypage";
		}
		
		return "member/mypage2";
	}
	
	//마이페이지2 : 회원정보 수정
	@RequestMapping("/mypage/mypage2")
	public String mypage2()	{
		return "member/mypage2";
	}

	//마이페이지3 : 회원탈퇴 완료
	@RequestMapping("/mypage/mypage3")
	public String mypage3()	{
		return "member/mypage3";
	}
	//마이페이지4 : 내 수강목록
	@RequestMapping("/mypage/mypage4")
	public String mypage4()	{
		return "member/mypage4";
	}
	//마이페이지5 : id/pw 찾기
	@RequestMapping("/mypage/mypage5")
	public String mypage5() {
		return "member/mypage5";
	}
	
	//나의 문의 내역
	@RequestMapping("/mypage/inquiry")
	public String inquiryHistory() {
		return "board/inquiryHistory";
	}
	
	//1:1 문의 작성 페이지
	@RequestMapping("/mypage/inquiry/write")
	public String inquiryWrite() {
		return "board/inquiryWrite";
	}
	
	@RequestMapping("/mypage/inquiry/read")
	public String inquiryRead() {
		return "board/inquiryRead";
	}
	
	
}
