package com.youngtvjobs.ycc.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.youngtvjobs.ycc.member.mail.MailHandler;
import com.youngtvjobs.ycc.member.mail.TempKey;

//회원관리 컨트롤러
@Controller
public class MemberController {
	
	MemberDao memberDao;
	MemberService memberService;
	
	@Autowired

	public MemberController(MemberDao memberDao, MemberService memberService) {
		//super();
		this.memberDao = memberDao;
		this.memberService = memberService;
	}

	//회원약관동의
	@GetMapping("/signin/agree")
	public String siagree() {
		return "member/siAgree";
	}
	//회원가입
	@GetMapping("/signin/form")
	public String siform() throws Exception	{
		System.out.println("get signin");
		return "member/siForm";
	}
	@PostMapping("/signin/form")
	public String siform( MemberDto dto, Model m) throws Exception	{
		System.out.println(dto.toString());
		memberService.signinMember(dto);
		m.addAttribute(dto);
		return "member/siComple";
		
	}
	//아이디중복체크 
	@PostMapping("/signin/idcheck")
	@ResponseBody
	public int idcheck(MemberDto dto,  Model m) throws Exception	{
		
		//System.out.println(dto.toString());
		//중복확인 체크 버튼을 누루지않고 회원가입버튼을 할 경우
		int result = memberService.idCheck(dto);
		System.out.println(result);
		return result;
	}
	
	//이메일 인증
	
	@Autowired
	JavaMailSender mailSender;
	
	@PostMapping("/signin/auth_check")
	public String insertMember(String user_email) throws Exception{
		//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
		String mail_key = new TempKey().getKey(7, false);	//랜덤키 길이 설정
		
		
		//회원가입 완료하면 인증을 위한 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Young문화체육센터 인증메일 입니다.]"); 	//메일제목
		sendMail.setText(
				"<h1>Young문화체육센터 메일인증</h1>" +
				"<br>Young문화체육센터에 오신것을 환영합니다!" +
				"<br>아래 [이메일 인증 확인]을 눌러주세요." +
				"<br><a href='http://localhost:8080/ycc/login/registerEmail?email=" + 
				"&mail_key=" + mail_key +
				"'target ='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("soojeontest01@gmail.com", "Young문화체육센터");
		sendMail.setTo(user_email);
		sendMail.send();
		
		
		return mail_key;
	}
	
	@GetMapping("/signin/")
	public String emailConfirm(MemberDto memberDto) throws Exception {
		
		memberService.updateMailAuth(memberDto);
		
		return "/member/emailAuthSuccess";
	}
	

	//마이페이지1 : 본인인증
	@GetMapping("/mypage/pwcheck")
	public String pwCheck(HttpSession session, HttpServletRequest request, String inputPassword) throws Exception	{
	    if(!logincheck(request)) 
	    	return "redirect:/login?toURL="+request.getRequestURL();

		return "member/pwCheck";
	}

	@PostMapping("/mypage/pwcheck")
	public String pwCheck(String inputPassword, HttpSession session, Model m) throws Exception	{
		
//		System.out.println(inputPassword);
		
		MemberDto memberDto = memberDao.loginSelect((String)session.getAttribute("id"));
	
		//DB의 pw와 입력된 pw가 같으면 modify로 리다이렉트, 그렇지 않으면 pwCheck로 돌아감
			if(memberDto.getUser_pw().equals(inputPassword)){

			return "redirect:/mypage/modify";
			}
			
			m.addAttribute("alert", "<script>alert('비밀번호가 일치하지 않습니다.')</script>");
			
		return "member/pwCheck";
	}

	//마이페이지 2: 회원 정보 수정
	@GetMapping("/mypage/modify")
	public String modify(HttpSession session, Model m) throws Exception {
		MemberDto memberDto = memberDao.loginSelect((String)session.getAttribute("id"));
		
		m.addAttribute("memberDto", memberDto);
		
		//이메일 아이디/도메인 분리하여 모델에 저장 (회원정보수정 이메일란에 출력)
		String emailId= memberDto.getUser_email().split("@")[0];
		String emailDomain=  memberDto.getUser_email().split("@")[1];
		
		m.addAttribute("emailId", emailId);
		m.addAttribute("emailDomain", emailDomain);
		
		//생년월일 String으로 형변환 & 포맷 지정하여 모델에 저장 (회원정보수정 생년월일란에 출력)
	    DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String birth_date = sdFormat.format(memberDto.getUser_birth_date());

		m.addAttribute("birth_date", birth_date);
		
		return "member/modify";
	}
	
	@PostMapping("/mypage/modify")
	public String modify(String id, String pw, String tel, String postCode, String rNameAddr, String detailAddr) throws Exception {
		
		MemberDto dto= new MemberDto(); 
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		dto.setUser_phone_number(tel);
		dto.setUser_postcode(postCode);
		dto.setUser_rNameAddr(rNameAddr);
		dto.setUser_detailAddr(detailAddr);
		
		memberService.ModifyMemberInfo(dto);

		return "redirect:/";
		
	}
	

	//마이페이지3 : 회원탈퇴 완료
	@RequestMapping("/mypage/withdraw")
	public String withdraw(HttpSession session) throws Exception	{
		
		memberService.withdraw((String) session.getAttribute("id"));
		session.invalidate();
		return "member/withdraw";
	}
	//마이페이지4 : 내 수강목록
	@RequestMapping("/mypage/mycourse")
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
		
		return "member/inquiryHistory";
	}
	
	//1:1 문의 작성 페이지
	@RequestMapping("/mypage/inquiry/write")
	public String inquiryWrite() {
		
		return "member/inquiryWrite";
	}
	//1:1 문의글 읽기 페이지
	@RequestMapping("/mypage/inquiry/read")
	public String inquiryRead() {
		return "member/inquiryWrite";
	}
	
    private boolean logincheck(HttpServletRequest request) {
    	
        HttpSession session = request.getSession(false);
        
        return session != null && session.getAttribute("id") != null;
     }
}
