package com.youngtvjobs.ycc.board;

import java.security.Principal;
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

import com.youngtvjobs.ycc.common.YccMethod;

//게시판 컨트롤러
@Controller
@RequestMapping("/board")
public class BoardController
{
	
	BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		//super();
		this.boardService = boardService;
	}
	
	//공지사항 게시판 
	@GetMapping("/notice")
	public String noticeBoard(Model model, SearchItem sc) {
		
		try {
			int totalCnt = boardService.nSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			//총 게시글 개수 
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			model.addAttribute("pr", pageResolver);
			//게시판 리스트 불러옴
			List<BoardDto> nList = boardService.nSearchSelectPage(sc);
			model.addAttribute("nList", nList);
			} catch (Exception e) {e.printStackTrace();}
		
		return "board/notice";
	}
	
	//이벤트 게시판 
	@GetMapping("/event")
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
	@GetMapping("/post")
	public String postSelect(SearchItem sc, Integer article_id, Model m) {
	
		try {
			BoardDto boardDto = boardService.postSelect(article_id);
			m.addAttribute("boardDto", boardDto);
			
			//이전글: article_id를 boardService의 movePage를 model에 담음 
			m.addAttribute("preView", boardService.movePage(article_id));
			//다음글: article_id를 boardService의 movePage를 model에 담음
			m.addAttribute("nextView", boardService.movePage(article_id));
			
		} catch(Exception e) {
			e.printStackTrace();
			//예외 발생시 게시판 페이지로 이동 요청 
			return "redirect:/board/notice";
		}
		
		return "board/post";
	}
	
	//게시글 작성하기 페이지 접속 
	@GetMapping("/write")
	public String write() throws Exception {
		
		return "board/write";
	}
	

	//게시글 작성 
	@PostMapping("/write")
	public String writePage(BoardDto boardDto, Principal principal) {		

			boardDto.setUser_id(principal.getName());
	
			try {		
				boardService.writeInsert(boardDto);

				//boardDto에서 받은 board-type이 "공지사항"이면 공지사항게시판에 insert
				if(boardDto.getArticle_Board_type().equals("공지사항") ) {
					//insert 후 공지사항 게시판으로 보여줌
					return "redirect:/board/notice";					
				}
				//boardDto에서 받은 board-type이 "이벤트"이면 이벤트/행사 게시판에 insert
				else if(boardDto.getArticle_Board_type().equals("이벤트") ) {
					//insert 후 이벤트 게시판으로 보여줌 
					return "redirect:/board/event";
				}
				
			} catch (Exception e) {e.printStackTrace();}
			
		return "redirect:/board/notice";
	}
	
	//게시글 삭제
   @PostMapping("/remove")
   public String remove(Integer article_id) {
      
      try {
    	  	//삭제할 데이터 가져오기
			BoardDto tmpboard=boardService.getArticleEdit(article_id);
			
			if(boardService.remove(article_id)== 1) {
			   //boardDto에서 받은 board-type이 "N"이면 공지사항게시판에 insert
			   if(tmpboard.getArticle_Board_type().equals("공지사항") ) {
				  //insert 후 공지사항 게시판으로 보여줌
				  return "redirect:/board/notice";               
			   }
			   //boardDto에서 받은 board-type이 "E"이면 이벤트/행사 게시판에 insert
			   else if(tmpboard.getArticle_Board_type().equals("이벤트") ) {
				  //insert 후 이벤트 게시판으로 보여줌 
				  return "redirect:/board/event";
			   }
			}
      } catch (Exception e) {e.printStackTrace();}
      
      return "redirect:/board/notice";
   }
	   
	//게시글 수정페이지로 이동
	@GetMapping("/edit")
	public String getArticleEdit(Integer article_id, Model m) {
		//boardMapper.xml에 select값을 가져오는 로직

		try {
			BoardDto boardDto = boardService.getArticleEdit(article_id);
			m.addAttribute("boardDto", boardDto);
		} catch (Exception e) {e.printStackTrace();}
	 return "board/edit";
	}
		
	//게시글 수정(등록)
	@PostMapping("/edit1")
	public String modify(BoardDto boardDto, Principal principal) {
		
		boardDto.setUser_id(principal.getName());
		//등록버튼 누를 시 수정됨
		try {
			boardService.modify(boardDto);
			if(boardDto.getArticle_Board_type().equals("공지사항") ) {
				//insert 후 공지사항 게시판으로 보여줌
				return "redirect:/board/notice";					
			}
			//boardDto에서 받은 board-type이 "E"이면 이벤트/행사 게시판에 
			else if(boardDto.getArticle_Board_type().equals("이벤트") ) {
				//insert 후 이벤트 게시판으로 보여줌 
				return "redirect:/board/event";
			}
		} catch(Exception e) {e.printStackTrace();}
		
		return "redirect:/board/notice";
	}
	
	//자주 묻는 질문(FAQ)
	@GetMapping("/faq")
	public String faq() {
		return "board/faq";
	}

}
