package com.youngtvjobs.ycc.member;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			//System.out.println(dto.toString());
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
	
	//마이페이지1 : 본인인증
	@GetMapping("/mypage/pwcheck")
	public String pwCheck(HttpSession session, HttpServletRequest request, String inputPassword) throws Exception	{
	    //비 로그인 시 접근 불가
		if(!YccMethod.loginSessionCheck(request)) 
	    	return "redirect:/login?toURL="+request.getRequestURL();

		return "member/pwCheck";
	}

	@PostMapping("/mypage/pwcheck")
	public String pwCheck(String inputPassword, HttpSession session, Model m) throws Exception	{
		
		MemberDto memberDto = memberDao.loginSelect((String)session.getAttribute("id"));
		
		//DB의 pw와 입력된 pw가 같으면 modify로 리다이렉트, 그렇지 않으면 pwCheck로 돌아감
		if (memberDto.getUser_pw().equals(inputPassword))
		{

			return "redirect:/mypage/modify";
		}
			
		m.addAttribute("alert", "<script>alert('비밀번호가 일치하지 않습니다.')</script>");
			
		return "member/pwCheck";
	}

	//마이페이지 2: 회원 정보 수정
	@GetMapping("/mypage/modify")
	public String modify(HttpServletRequest request, HttpSession session, Model m) throws Exception {
		// 비 로그인 시 접근 불가
		if (!YccMethod.loginSessionCheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();

		MemberDto memberDto = memberDao.loginSelect((String)session.getAttribute("id"));
		
		m.addAttribute("memberDto", memberDto);
		
		//이메일 아이디/도메인 분리하여 모델에 저장 (회원정보수정 이메일란에 출력)
		String emailId= memberDto.getUser_email().split("@")[0];
		String emailDomain=  memberDto.getUser_email().split("@")[1];
		
		m.addAttribute("emailId", emailId);
		m.addAttribute("emailDomain", emailDomain);
		
		// 생년월일 String으로 형변환 & 포맷 지정하여 모델에 저장 (회원정보수정 생년월일란에 출력)		
		String birth_date = YccMethod.date_toString(memberDto.getUser_birth_date());
		
		m.addAttribute("birth_date", birth_date);

		return "member/modify";
	}
	
	@PostMapping("/mypage/modify")
	public String modify(MemberDto memberDto){
		try {
			memberService.ModifyMemberInfo(memberDto);
		} catch (Exception e) {e.printStackTrace();}

		return "redirect:/";

	}
	

	//마이페이지3 : 회원탈퇴 완료
	@RequestMapping("/mypage/withdraw")
	public String withdraw(HttpSession session, HttpServletRequest request) throws Exception {
		//비 정상적 접근 차단
		if (!YccMethod.loginSessionCheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();
		
		//tb_user테이블에서 session에 저장된 id와 같은 user_id를 가진 회원을 삭제시킨후 세션을 종료시킴
		memberService.withdraw((String) session.getAttribute("id"));
		session.invalidate();
		return "member/withdraw";
	}
	//마이페이지4 : 내 수강목록
	@RequestMapping("/mypage/mycourse")
	public String myCourse(HttpServletRequest request)	{
		if(!YccMethod.loginSessionCheck(request)) 
			return "redirect:/login?toURL="+request.getRequestURL();
		return "member/mypage4";
	}
	//마이페이지5 : id/pw 찾기
	@RequestMapping("/mypage/forget")
	public String forget() {
		return "member/forget";
 	}
	
	//아이디 찾기
	@PostMapping("/mypage/findId")
	@ResponseBody
	public String findId(HttpServletResponse response, @RequestBody MemberDto memberDto) throws Exception{
		
		return memberService.findId(response, memberDto.getUser_email(), memberDto.getUser_name());
	}
	//패스워드 찾기
	@PostMapping("/mypage/findPw")
	@ResponseBody
	public String findPw(HttpServletResponse response, @RequestBody MemberDto memberDto) throws Exception{
		
		return memberService.findPw(response, memberDto.getUser_id(), memberDto.getUser_name());
	}
	
	//1:1 문의
	// 나의 문의 내역 - 기간별 조회
		@GetMapping("/mypage/inquiry")
		public String inquiryHistory(
				SearchByPeriod sp,
				String settedInterval,HttpSession session, Model m,
				HttpServletRequest request, String startDate, String endDate) {
			//로그인 여부 확인
			if (!YccMethod.loginSessionCheck(request))
				return "redirect:/login?toURL=" + request.getRequestURL();
			
			
			try {
				int totalCnt;
				InqPageResolver pr;
				
				//서비스 메소드에 파라미터로 넣어줄 id,디폴트 settedInterval(1개월) 불러오기
				String id = (String) session.getAttribute("id");
				
				if(settedInterval == null) {
					settedInterval = sp.getSettedInterval();
				}
				
				//1개월,3개월 버튼을 클릭했을 때 동작(name="settedInterval")
				if (settedInterval.equals("3month") || settedInterval.equals("6month")) {
					//list
					List<InquiryDto> inqList = inquiryService.getPage(id, sp);
					m.addAttribute("inqList", inqList);
					
					//pagination
					totalCnt= inquiryService.getPageCnt(id, sp);
					pr = new InqPageResolver(sp, totalCnt);
					m.addAttribute("pr", pr);					
					m.addAttribute("totalCnt", totalCnt);
					
					return "member/inquiryHistory";
				}
				//조회기간을 직접 설정해 주었을 때 동작
				else if (startDate != null && endDate != null &&!startDate.equals("") && !endDate.equals("")) {
					//list
					List<InquiryDto> inqList = inquiryService.getPageByInput(id, sp);
					
					m.addAttribute("inqList", inqList);
					m.addAttribute("startDate",sp.getStartDate());
					m.addAttribute("endDate",sp.getEndDate());
					
					//pagination
					totalCnt= inquiryService.getPageByInputCnt(id, sp);
					pr = new InqPageResolver(sp, totalCnt);
					m.addAttribute("pr", pr);
					m.addAttribute("totalCnt", totalCnt);
					
					return "member/inquiryHistory";
				}
				//버튼조작, 기간설정 없을시 기본 1개월 조회 동작
				//list
				List<InquiryDto> inqList = inquiryService.getPage(id,sp);
				m.addAttribute("inqList", inqList);
				
				//pagination
				totalCnt= inquiryService.getPageCnt(id, sp);
				pr = new InqPageResolver(sp,totalCnt);
				m.addAttribute("pr", pr);
				m.addAttribute("totalCnt", totalCnt);
				
				return "member/inquiryHistory";

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "member/inquiryHistory";
		}

	// 1:1 문의글: 작성하기 
	@GetMapping("/mypage/inquiry/write")
	public String inquiryWrite() {
		
		return "member/inquiryWrite";
	}
	
	// 1:1 문의글: 작성한 글 등록하기
	@PostMapping("/mypage/inquiry/write")
	public String inquiryWrite(InquiryDto inquiryDto, RedirectAttributes rattr, Model m, HttpSession session) {
		//글 작성자와 현재 날짜 설정
		String id = (String) session.getAttribute("id");
		inquiryDto.setUser_id(id);
		inquiryDto.setInq_date(new Date());
		
		try {
			// 등록에 실패하면 예외처리
			if (inquiryService.wirteInq(inquiryDto) !=1) {
				throw new Exception("Write Failed");}
				
			rattr.addFlashAttribute("msg", "WRT_OK");
			
			return "redirect:/mypage/inquiry";	
			
		} catch (Exception e) { 
			e.printStackTrace();
			m.addAttribute("inquiryDto",inquiryDto);
			m.addAttribute("msg", "WRT_ERR");
			
			return "member/inquiryWrite";
		}
		
		
	}

	// 1:1 문의글 읽기 페이지
	@GetMapping("/mypage/inquiry/read")
	public String inquiryRead(Integer inq_id, 
			@RequestParam(defaultValue="1") Integer page, 
			@RequestParam(defaultValue="6") Integer pageSize,Model m, HttpSession session
			) {
		try {
			//id 와 inq_id로 문의글 내용 불러오기
			String id = (String) session.getAttribute("id");
			InquiryDto inquiryDto = inquiryService.read(id,inq_id);
			
			m.addAttribute(inquiryDto);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/mypage/inquiry";
		}
		
		return "member/inquiryRead";
	}
}
