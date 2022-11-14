package com.youngtvjobs.ycc.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//회원관리 컨트롤러
@Controller
public class MemberController {
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
	@RequestMapping("/mypage")
	public String mypage1()	{
		return "member/mypage1";
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
}
