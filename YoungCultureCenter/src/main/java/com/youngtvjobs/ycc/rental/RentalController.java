package com.youngtvjobs.ycc.rental;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController
{
	//독서실 대여
	@RequestMapping("/rental/studyroom")
	public String studyRoom()
	{
		return "rental/studyRoom";
	}
	//사물함 안내
	@RequestMapping("/rental/locker")
	public String lockerinfo()
	{
		return "rental/lockerinfo";
	}
	//사물함 신청
	@RequestMapping("/rental/locker/reservation")
	public String locker()
	{
		return"rental/locker";
	}
	
	//대관신청
	@RequestMapping("/rental/place")
	public String rentalPlace()
	{
		return "rental/place";
	}
	
}
