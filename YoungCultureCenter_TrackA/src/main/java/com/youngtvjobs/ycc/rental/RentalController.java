package com.youngtvjobs.ycc.rental;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RentalController {

	@Autowired
	RentalService rentalService;

	// 독서실 대여
	@RequestMapping("/rental/studyroom")
	public String studyRoom() {
		return "rental/studyRoom";
	}

	// 사물함 안내
	@RequestMapping("/rental/locker")
	public String lockerinfo() {
		return "rental/lockerinfo";
	}

	// 사물함 신청
	@RequestMapping("/rental/locker/reservation")
	public String locker() {
		return "rental/locker";
	}

	// 대관신청

	@GetMapping("/rental/place")
	// Dto에서 장소들 이름 받아와 selectBox에 출력해주는 메서드

	public String selectpage(Model m, HttpServletRequest request) {
		// 로그인 확인
		// if(!logincheck(request))
		// return "redirect:/login?toURL="+request.getRequestURL();

		// dto에서 장소 이름들 받아오는 부분
		try {
			List<RentalDto> placelist = rentalService.selectRentalPlace();
			m.addAttribute("placelist", placelist);
			System.out.println(placelist);
			
			List<RentalDto> timelist = rentalService.selectschedule();
			m.addAttribute("timelist", timelist);
			System.out.println(timelist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "rental/place";
	}

	@GetMapping("/rental/place.send")
	public ResponseEntity<List<RentalDto>> rentalcheck(@RequestParam("croom_id") String croom_id,
			@RequestParam("prental_de") String prental_de, HttpServletRequest request) {

		List<RentalDto> list = null;
		System.out.println(croom_id);
		System.out.println(prental_de);
		

		RentalDto rentalDto = new RentalDto();

		try {

			// jsp에서 온 값이 string이므로 DB에서 값을 가져오려면 Date 형식으로 변환해줘야 함 / 해당 부분을 이행하기 위해 형변환 후
			// setter를 이용해 지정해주는 부분
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date_rental_de = sdf.parse(prental_de);
			rentalDto.setPrental_de(date_rental_de);

			/*
			 * String croom_id2 = URLDecoder.decode(croom_id, "UTF-8"); String prental_de2 =
			 * URLDecoder.decode(prental_de, "UTF-8");
			 */

			list = rentalService.getList(croom_id, date_rental_de);
			
			System.out.println("list : " + list); // 하나의 인자씩 받아와서 해보기
			return new ResponseEntity<List<RentalDto>>(list, HttpStatus.OK); // 200

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<RentalDto>>(HttpStatus.BAD_REQUEST); // 400
		}

	}

	@PostMapping("/rental/place")
	public String rental(RentalDto rentalDto, RedirectAttributes rattr, HttpSession session, Model m) throws Exception{
		
		String customer = (String)session.getAttribute("id");
		rentalDto.setUser_id(customer);
		
		try {
			if(rentalService.rental(rentalDto) != 1)
				throw new Exception("Rental Failed");
			rattr.addFlashAttribute("msg", "REN_OK");
			return "redirect:/rental/place";
			
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "REN_ERR");
			return "place";
		}
	}

	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}

}
