package com.youngtvjobs.ycc.club;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClubController
{

	@RequestMapping("/club")
	public String clubMain()
	{
		return "club/clubmain";
	}
	
	@RequestMapping("/club/create")
	public String clubCreate()
	{
		return "club/create";
	}

	@RequestMapping("/club/board")
	public String clubBoard()
	{
		return "club/club_board";
	}

	@RequestMapping("club/board/view")
	public String boardView()
	{
		return "club/board/view";
	}
	
	@RequestMapping("club/board/edit")
	public String clubEdit()
	{
		return "club/board/edit";
	}

	@RequestMapping("club/board/write")
	public String clubWrite()
	{
		return "club/board/write";
	}

	
}
