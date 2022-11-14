package com.youngtvjobs.ycc.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//게시판 컨트롤러
@Controller
public class BoardController
{

	@RequestMapping("/board/notice")
	public String noticeBoard()
	{
		return "board/notice";
	}

	@RequestMapping("/board/event")
	public String eventBoard()
	{
		return "board/event";
	}

	@RequestMapping("/board/edit")
	public String postEdit()
	{
		return "board/edit";
	}

	@RequestMapping("/board/write")
	public String writePage()
	{
		return "board/write";
	}

	@RequestMapping("/board/post")
	public String postView()
	{
		return "board/post";
	}
	
	//나의 문의 내역
	@RequestMapping("/board/inquiry/history")
	public String inquiryHistory() {
		return "board/inquiryHistory";
	}
	
	//1:1 문의 작성 페이지
	@RequestMapping("/board/inquiry/write")
	public String inquiryEdit() {
		return "board/inquiryWrite";
	}
	
	//자주 묻는 질문(FAQ)
	@RequestMapping("/board/faq")
	public String faq() {
		return "board/faq";
	}

}
