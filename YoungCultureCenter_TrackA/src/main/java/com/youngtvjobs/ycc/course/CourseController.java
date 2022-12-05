package com.youngtvjobs.ycc.course;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CourseController {

	@Autowired
	CourseService courseService;

	@RequestMapping("/course/courseinfo")
	public String courseinfo() {
		return "/course/courseinfo";
	}

	@RequestMapping("/course/schedule")
	public String courseSchedule() {
		return "/course/courseSchedule";
	}

	@GetMapping("/payment")
	public String IntegratedPayment() {
		return "/integratedPayment";
	}
	
	// 수강신청 클릭 후 이동하는 페이지
	@GetMapping("/course/regcomplete")
	public String courseRegComplete(Integer course_id, AttendDto attendDto, Model m
									, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) {
		String user_id = (String) session.getAttribute("id"); // 세션에 저장되어 있는 id 불러오기
		Date nowdate = new Date(); // 오늘날짜 객체 생성

		attendDto.setUser_id(user_id);
		attendDto.setCourse_id(course_id);

//		System.out.println(nowdate);
		System.out.println("attendDto" + attendDto);

		try {
			m.addAttribute("attendDto", attendDto);

			// 등록강좌 상세불러오기
			CourseDto courseDto = courseService.readCourseDetail(course_id);
			m.addAttribute("courseDto", courseDto);

			// 수강신청
			// 중복 방지
			if (courseService.attendDuplicateCheck(course_id, user_id) == 0) {
				// 강좌 상태 확인
				// 접수기간
				// reg_start_date는 nowdate보다 이전이다(reg_start_date < nowdate) && reg_end_date는
				// nowdate보다 이후이다(nowdate < reg_end_date)
				if ((courseDto.getCourse_reg_start_date().before(nowdate) == true
						&& courseDto.getCourse_reg_end_date().before(nowdate) == true)
						|| (courseDto.getCourse_reg_start_date().before(nowdate) == true
								&& courseDto.getCourse_reg_end_date().after(nowdate) == true)) { 
					// 수강신청 시 attend에 insert & 신청인원 1명 증가
					courseService.attendInsert(attendDto); 
					rattr.addFlashAttribute("msg", "REG_COMPLETE");
				// 신청인원을 총정원과 비교	
				} else if (courseDto.getCourse_applicants() >= courseDto.getCroom_mpop()) {
					System.out.println("정원이 마감되었습니다.");
					rattr.addFlashAttribute("msg", "overcapacity");
					return "redirect:/course/search";
				} else {
					System.out.println("접수기간이 아닙니다.");
					rattr.addFlashAttribute("msg", "NO_PERIOD");
					return "redirect:/course/search";
				}
			} else {
				System.out.println("중복 신청은 할 수 없습니다.");
				rattr.addFlashAttribute("msg", "OVERLAP");
				return "redirect:/course/search";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();

			return "redirect:/course/detail?toURL=" + request.getRequestURL();
		}
		
		return "/course/courseRegComplete";
	}
	
	@PostMapping("/course/modify")
	public String courseModify(CourseDto courseDto, Integer page, Integer pageSize, 
								RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		courseDto.setUser_id(user_id);
		
		try {
			if(courseService.coursemodify(courseDto) != 1)
				throw new Exception("Modify failed");
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			  
			return "redirect:/course/search";
		} catch (Exception e) {
			e.printStackTrace();
			
			m.addAttribute(courseDto);
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			
			m.addAttribute("msg", "MOD_ERR");
			  
			return "/course/coursedetail";
		}
	}
	
	@GetMapping("/course/modify")
	public String courseModify(Model m, Integer course_id, CourseSearchItem sc, HttpServletRequest request) {
		try {
			CourseDto courseDto = courseService.readCourseDetail(course_id);
			System.out.println(course_id);
			System.out.println(courseDto);
			m.addAttribute(courseDto);
			m.addAttribute("mode", "modify");
			
			// 수정페이지에 queryString을 넘겨주기 위해서
			int totalCnt = courseService.getsearchResultCnt(sc);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/course/coursedetail"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}

	@PostMapping("/course/remove")
	public String courseRemove(Integer course_id, @RequestParam("user_id")String user_id, Integer page, Integer pageSize
			, RedirectAttributes rattr, HttpSession session) {
		
		String msg = "DEL_OK";
		
		try {
			if(session.getAttribute("id").equals(user_id) || session.getAttribute("grade").equals("관리자")) {
				if (courseService.courseRemove(course_id) != 1) throw new Exception("Delete failed.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg", msg);

		return "redirect:/course/search";
	}

	@PostMapping("/course/write")
	public String courseWrite(CourseDto courseDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		courseDto.setUser_id(user_id);

		try {
			if (courseService.courseWrite(courseDto) != 1)
				throw new Exception("Write failed");

			rattr.addFlashAttribute("msg", "WRT_OK");

			return "redirect:/course/search";
		} catch (Exception e) {
			e.printStackTrace();

			m.addAttribute("mode", "new");
			m.addAttribute("courseDto", courseDto);
			m.addAttribute("msg", "WRT_ERR");

			return "/course/coursedetail";
		}

	}

	@GetMapping("/course/write")
	public String courseWrite(Model m, HttpServletRequest request) {
		if (!logincheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();

		m.addAttribute("mode", "new");

		return "/course/coursedetail"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}

	@GetMapping("/course/detail")
	public String coursedetail(CourseSearchItem sc, Integer course_id, Model m, HttpServletRequest request) {
		
		// System.out.println("redirect:/login?toURL=" + request.getRequestURL()+"?"+request.getQueryString());
		
		// 로그인 체크시 exception 이슈 해결
		if (!logincheck(request)) {
			return "redirect:/login?toURL="+request.getRequestURL()+"?course_id="+course_id;
		}

		try {
			CourseDto courseDto = courseService.readCourseDetail(course_id);
			m.addAttribute(courseDto);

			// 수강신청완료페이지에 queryString을 넘겨주기 위해서
			int totalCnt = courseService.getsearchResultCnt(sc);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);

			// 리뷰 개수가 0개일 경우 발생하는 NullPointerException으로 인해 추가
			if (courseDto.getReview_cnt() == 0) {
				double rating = 0;
				m.addAttribute("rating", rating);
			} else {
				System.out.println("리뷰개수=" + courseDto.getReview_cnt());
				double rating = courseService.avgReviewRating(course_id);
				m.addAttribute("rating", rating);
			}
		} catch (Exception e) {
			System.out.println("catch문 진입");
			e.printStackTrace();
			
			return "redirect:/course/search";
		}

		return "/course/coursedetail";
	}

	@GetMapping("/course/search")
	public String courseSearch(CourseSearchItem sc, Model m, HttpServletRequest request) {
//		if(!logincheck(request)) 
//			return "redirect:/login?toURL="+request.getRequestURL();

		try {
			int totalCnt = courseService.getsearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);

			PageResolver pageResolver = new PageResolver(totalCnt, sc);
//			CourseDto courseDto = new CourseDto();

			List<CourseDto> list = courseService.getsearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);

			// System.out.println(list.get(0).toString());
//			System.out.println(courseDto.toString());
			// System.out.println(sc.toString());
			// System.out.println(sc.getQueryString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/course/courseSearch";
	}

	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}
}