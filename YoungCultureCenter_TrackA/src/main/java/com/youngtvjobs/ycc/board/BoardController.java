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
			
			List<BoardDto> nList = boardService.nSelectPage(sc);
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
			
			List<BoardDto> eList = boardService.eSelectPage(sc);
			model.addAttribute("eList", eList);
			model.addAttribute("pr", pageResolver);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return "board/event";
	}
	//게시글 상세 보기 
	@GetMapping("/board/post")
	public String postSelect(SearchItem sc, Integer article_id,  Model m) {
	
		try {
			BoardDto boardDto = boardService.postSelect(article_id);
			m.addAttribute("boardDto", boardDto);
			
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
		//로그인이 안되어있으면 로그인 페이지로 이동 
		if(!loginCheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();
		//로그인 되어있으면 글 작성 페이지로 이동 
		else 
			return "board/write";
	}
	
	private boolean loginCheck(HttpServletRequest request) {
		// session 얻어서 false는 session이 없어도 새로 생성하지 않음. 반환값 null
		 HttpSession session = request.getSession(false);	
		// session id가 있는지 확인, 있으면 true 반환 아이디에 대한 값이 있으니 로그인 페이지로 이동X
		 return session != null && session.getAttribute("id") != null; 
	
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
				rttr.addFlashAttribute("result", "write success");
				
				return "redirect:/board/notice";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return "redirect:/board/notice";
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
