package com.youngtvjobs.ycc.member;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.youngtvjobs.ycc.common.YccMethod;

//회원관리 컨트롤러
@Controller
public class MemberController {

	MemberDao memberDao;
	MemberService memberService;

	InquiryService inquiryService;
	InquiryDao inquiryDao;		
	
	JavaMailSender mailSender;

	@Autowired
	public MemberController(MemberDao memberDao, MemberService memberService, InquiryService inquiryService,
			InquiryDao inquiryDao, JavaMailSender mailSender) {
		//super();
		this.memberDao = memberDao;
		this.memberService = memberService;
		this.inquiryService = inquiryService;
		this.inquiryDao = inquiryDao;
		this.mailSender = mailSender;
	}

	// 회원약관동의
	@GetMapping("/signin/agree")
	public String siagree() {
		return "member/siAgree";
	}

	// 회원가입
	@GetMapping("/signin/form")
	public String siform() throws Exception {
		System.out.println("get signin");
		return "member/siForm";
	}

	@PostMapping("/signin/form")
	public String siform(MemberDto dto, Model m) throws Exception {
		System.out.println(dto.toString());
		memberService.signinMember(dto);
		m.addAttribute(dto);
		return "member/siComple";

	}

	// 아이디중복체크
	@PostMapping("/signin/idcheck")
	@ResponseBody
	public int idcheck(MemberDto dto, Model m) throws Exception {

		// System.out.println(dto.toString());
		// 중복확인 체크 버튼을 누루지않고 회원가입버튼을 할 경우
		int result = memberService.idCheck(dto);
		System.out.println(result);
		return result;
	}
	
	//이메일 인증 : siForm.jsp에서 넘겨받은 값을 memberService.java에 memberdto.getUser_email()에 담아서 전달해줌
	@PostMapping("/signin/registerEmail")
	@ResponseBody
	public String emailConfirm1(@RequestBody MemberDto memberdto) throws Exception {
		
		return memberService.insertMember(memberdto.getUser_email());
	}
		
	// 비밀번호 보내기
	@PostMapping("/signin/pwEmail")
	@ResponseBody
	public String emailSendPw(@RequestBody MemberDto memberdto) throws Exception {
		return memberService.pwSendEmail(memberdto.getUser_email());
	}


	// 마이페이지1 : 본인인증
	@GetMapping("/mypage/pwcheck")
	public String pwCheck(HttpSession session, HttpServletRequest request, String inputPassword) throws Exception {
		
		if (!YccMethod.loginSessionCheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();

		return "member/pwCheck";
	}

	@PostMapping("/mypage/pwcheck")
	public String pwCheck(String inputPassword, HttpSession session, Model m) throws Exception {

//		System.out.println(inputPassword);

		MemberDto memberDto = memberDao.loginSelect((String) session.getAttribute("id"));

		// DB의 pw와 입력된 pw가 같으면 modify로 리다이렉트, 그렇지 않으면 pwCheck로 돌아감
		if (memberDto.getUser_pw().equals(inputPassword)) {

			return "redirect:/mypage/modify";
		}

		m.addAttribute("alert", "<script>alert('비밀번호가 일치하지 않습니다.')</script>");

		return "member/pwCheck";
	}

	// 마이페이지 2: 회원 정보 수정
	@GetMapping("/mypage/modify")
	public String modify(HttpSession session, Model m) throws Exception {
		MemberDto memberDto = memberDao.loginSelect((String) session.getAttribute("id"));

		m.addAttribute("memberDto", memberDto);

		// 이메일 아이디/도메인 분리하여 모델에 저장 (회원정보수정 이메일란에 출력)
		String emailId = memberDto.getUser_email().split("@")[0];
		String emailDomain = memberDto.getUser_email().split("@")[1];

		m.addAttribute("emailId", emailId);
		m.addAttribute("emailDomain", emailDomain);

		// 생년월일 String으로 형변환 & 포맷 지정하여 모델에 저장 (회원정보수정 생년월일란에 출력)		
		String birth_date = YccMethod.date_toString(memberDto.getUser_birth_date());
		
		m.addAttribute("birth_date", birth_date);

		return "member/modify";
	}

	@PostMapping("/mypage/modify")
	public String modify(String id, String pw, String tel, String postCode, String rNameAddr, String detailAddr)
			throws Exception {

		MemberDto dto = new MemberDto();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		dto.setUser_phone_number(tel);
		dto.setUser_postcode(postCode);
		dto.setUser_rNameAddr(rNameAddr);
		dto.setUser_detailAddr(detailAddr);

		memberService.ModifyMemberInfo(dto);

		return "redirect:/";

	}

	// 마이페이지3 : 회원탈퇴 완료
	@RequestMapping("/mypage/withdraw")
	public String withdraw(HttpSession session) throws Exception {

		memberService.withdraw((String) session.getAttribute("id"));
		session.invalidate();
		return "member/withdraw";
	}

	// 마이페이지4 : 내 수강목록
	@RequestMapping("/mypage/mycourse")
	public String mypage4() {
		return "member/mypage4";
	}

	// 마이페이지5 : id/pw 찾기
	@RequestMapping("/mypage/mypage5")
	public String mypage5() {
		return "member/mypage5";
	}

	//아이디 찾기
	@PostMapping("/mypage/findId")
	@ResponseBody
	public String findId(HttpServletResponse response, @RequestBody MemberDto memberDto) throws Exception{
		
		return memberService.findId(response, memberDto.getUser_email());
	}
	//패스워드 찾기
	@PostMapping("/mypage/findPw")
	@ResponseBody
	public String findPw(HttpServletResponse response, @RequestBody MemberDto memberDto) throws Exception{
		
		return memberService.findPw(response, memberDto.getUser_id());
	}


	// 나의 문의 내역 - 기간별 조회
		@GetMapping("/mypage/inquiry")
		public String inquiryHistory(String settedInterval,HttpSession session, Model m, 
				HttpServletRequest request, String startDate, String endDate) {
			//로그인 여부 확인
			if (!YccMethod.loginSessionCheck(request))
				return "redirect:/login/login?toURL=" + request.getRequestURL();
			
			
			try {
				//서비스 메소드에 파라미터로 넣어줄 id,디폴트 settedInterval(1개월) 불러오기
				String id = (String) session.getAttribute("id");
				InquiryDto inquiryDto = new InquiryDto();
				
				if(settedInterval == null) {
					settedInterval = inquiryDto.getSettedInterval();
				}
				//1개월,3개월 버튼을 클릭했을 때 동작(name="settedInterval")
				if (settedInterval.equals("3month") || settedInterval.equals("6month")) {
					
					
					List<InquiryDto> inqList = inquiryService.getPage(id, settedInterval);
					m.addAttribute("inqList", inqList);
					
					return "member/inquiryHistory";
				}
				else if (startDate != null && endDate != null &&!startDate.equals("") && !endDate.equals("")) {

					//String으로 받은 날짜를 Date로 형변환
					Date sd =YccMethod.str_toDate(startDate);
					Date ed = YccMethod.str_toDate(endDate);
					
					System.out.println(sd);
					System.out.println(ed);
					
					List<InquiryDto> inqList = inquiryService.getPageByInput(id, sd, ed);
					
					m.addAttribute("inqList", inqList);
					m.addAttribute("startDate",startDate);
					m.addAttribute("endDate",endDate);
					

					return "member/inquiryHistory";
				}
				// 조회 시작일, 종료일 중 하나라도 null값일 경우 alert창
//				else if(startDate == null || endDate == null) {
//					System.out.println("하나라도 null 값이 있을 경우 ");
//					m.addAttribute("alert","<script>alert('조회 시작일과 종료일을 모두 지정해 주세요.')</script>");
//					return "member/inquiryHistory";					
//				}
				
				List<InquiryDto> inqList = inquiryService.getPage(id, inquiryDto.getSettedInterval());
				m.addAttribute("inqList", inqList);
				
				return "member/inquiryHistory";

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "member/inquiryHistory";
		}

	// 1:1 문의 작성 페이지
	@RequestMapping("/mypage/inquiry/write")
	public String inquiryWrite() {

		return "member/inquiryWrite";
	}

	// 1:1 문의글 읽기 페이지
	@RequestMapping("/mypage/inquiry/read")
	public String inquiryRead() {
		return "member/inquiryWrite";
	}
}