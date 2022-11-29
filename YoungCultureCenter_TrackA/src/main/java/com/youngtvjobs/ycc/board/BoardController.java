package com.youngtvjobs.ycc.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			int totalCnt = boardService.nSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			//총 게시글 개수 
			//System.out.println(totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<BoardDto> nList = boardService.nSearchSelectPage(sc);
			model.addAttribute("nList", nList);
			model.addAttribute("pr", pageResolver);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/notice";
	}
	//이벤트 게시판 
	@GetMapping("/board/event")
	public String eventBoard(Model model, SearchItem sc) {
		
		try {
			int totalCnt = boardService.eSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			//System.out.println(totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<BoardDto> eList = boardService.eSearchSelectPage(sc);
			model.addAttribute("eList", eList);
			model.addAttribute("pr", pageResolver);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return "board/event";
	}
	
	//게시글 상세 보기 
	@GetMapping("/board/post")
	public String postSelect(SearchItem sc,
			@RequestParam ("article_id") Integer article_id, Model m) {
	
		try {
			BoardDto boardDto = boardService.postSelect(article_id);
			m.addAttribute("boardDto", boardDto);
			//이전글, 다음글 
			m.addAttribute("preView", boardService.movePage(article_id));
			m.addAttribute("nextView", boardService.movePage(article_id));
		} catch(Exception e) {
			e.printStackTrace();
			//예외 발생시 게시판 페이지로 이동 요청 
			return "redirect:/board/notice";
		}
		
		return "board/post";
	}
	
	//게시글 작성 접속 
	@GetMapping("/board/write")
	public String write(BoardDto boardDto, Model model ,HttpServletRequest request) {
		
			return "board/write";
	}
	

	//게시글 작성 
	@PostMapping("/board/write")
	public String writePage(BoardDto boardDto, RedirectAttributes rttr, Model model,
			HttpSession session	) throws Exception {		
			
			//session에 저장된 user_id를 저장 
        	String user_id = (String)session.getAttribute("id");
        	//boardDto에 user_id 설정
        	boardDto.setUser_id(user_id);
		
			try {
				boardService.writeInsert(boardDto);
				return "redirect:/board/notice";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return "redirect:/board/notice";
	}
	
	//게시글 삭제
	@PostMapping("/board/delete")
	public String postDelete() {
			return "/board/notice";
		
	
	}
		
	//게시글 수정
	@RequestMapping("/board/edit")
	public String postEdit()
	{
		return "board/edit";
	}

	
	//자주 묻는 질문(FAQ)
	@RequestMapping("/board/faq")
	public String faq() {
		return "board/faq";
	}

}
