package com.youngtvjobs.ycc.course;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	// 수강후기 수정
	@PatchMapping("/course/reviews/{review_id}")
	public ResponseEntity<String> modify(@PathVariable Integer review_id, String user_id
											, @RequestBody ReviewDto reviewDto, HttpSession session) {
		
		//String user_id = (String) session.getAttribute("id");
		
		reviewDto.setUser_id(user_id); // 작성자 id
		reviewDto.setReview_id(review_id); // 작성된 reivew_id
		
		try {
			// '작성자'와 동일한 계정이거나 '관리자'일 경우 수정 가능
			if(session.getAttribute("id").equals(user_id) || session.getAttribute("grade").equals("관리자")) {
				if(reviewService.modify(reviewDto) != 1) throw new Exception("Update failed.");
			}		
				
			return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	// 수강후기 삭제
	@DeleteMapping("/course/reviews/{review_id}")
	public ResponseEntity<String> remove(@PathVariable Integer review_id, Integer course_id, String user_id
														, ReviewDto reviewDto, HttpSession session) {
		reviewDto.setUser_id(user_id); // 작성자 id
		//String user_id = (String) session.getAttribute("id");
		
		try {
			int rowCnt = reviewService.reviewDelete(review_id, course_id);
			System.out.println(rowCnt);
			
			// '작성자'와 동일한 계정이거나 '관리자'일 경우 삭제 가능 + review_cnt 감소
			if(session.getAttribute("id").equals(user_id) || session.getAttribute("grade").equals("관리자")) {
				if(rowCnt != 1) throw new Exception("Delete Failed");
			}
			
			return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	// 수강후기 작성
	@PostMapping("/course/reviews")
	public ResponseEntity<String> write(@RequestBody ReviewDto reviewDto, Integer course_id, HttpSession session){
		String user_id = (String) session.getAttribute("id");
		
		reviewDto.setUser_id(user_id);
		reviewDto.setCourse_id(course_id);
		
		System.out.println("reviewDto" + reviewDto);
		
		try {
			// 수강신청(attend) 테이블에 있을 경우에만 작성 가능하게 구현 '예정'
			if(reviewService.reviewWrite(reviewDto) != 1)
				throw new Exception("write failed");
			
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	// 수강후기 select
	@GetMapping("/course/reviews")
	@ResponseBody
	public ResponseEntity<List<ReviewDto>> list(Integer course_id/* , CourseSearchItem sc, Model m */){
		List<ReviewDto> list = null;
		
		try {
			list = reviewService.selectReviewList(course_id);
			System.out.println("list = " + list);
			
//			int totalCnt = reviewService.getCourseReviewCnt(sc);
//			m.addAttribute("totalCnt", totalCnt);
//			System.out.println("리뷰개수:"+ totalCnt);
//			
//			PageResolver pageResolver1 = new PageResolver(totalCnt, sc);
//			m.addAttribute("prRe", pageResolver1);

			return new ResponseEntity<List<ReviewDto>>(list, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<List<ReviewDto>>(HttpStatus.BAD_REQUEST);
		}
	}
}
