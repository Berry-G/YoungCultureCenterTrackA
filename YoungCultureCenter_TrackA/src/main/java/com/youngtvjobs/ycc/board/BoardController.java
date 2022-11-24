package com.youngtvjobs.ycc.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//게시판 컨트롤러
@Controller
public class BoardController
{
	
	BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}
	
	//공지사항 게시판 
	@GetMapping("/board/notice")
	public String noticeBoard(Model model, SearchItem sc) {
		
		try {
			int totalCnt = boardService.searchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			System.out.println(totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<BoardDto> list = boardService.listPage(sc);
			model.addAttribute("list", list);
			model.addAttribute("pr", pageResolver);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/notice";
	}
	//이벤트 게시판 
	@RequestMapping("/board/event")
	public String eventBoard()
	{
		return "board/event";
	}
	//게시글 상세 보기 
	@RequestMapping("/board/post")
	public String postView()
	{
		return "board/post";
	}
	//게시글 수정
	@RequestMapping("/board/edit")
	public String postEdit()
	{
		return "board/edit";
	}
	//게시글 작성
	@RequestMapping("/board/write")
	public String writePage()
	{
		return "board/write";
	}

	
	//자주 묻는 질문(FAQ)
	@RequestMapping("/board/faq")
	public String faq() {
		return "board/faq";
	}

}
