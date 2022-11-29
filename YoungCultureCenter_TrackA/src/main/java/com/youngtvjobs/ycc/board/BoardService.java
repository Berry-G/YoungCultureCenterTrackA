package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	//CRUD(글쓰기, 읽기, 수정, 삭제)
	void writeInsert(BoardDto boardDto) throws Exception;
	int remove(Integer article_id, String user_id) throws Exception;
	
	//공지사항 게시판 리스트 
	List<BoardDto> nSelectPage (SearchItem sc) throws Exception;
	
	//공지사항 총 게시물 개수
	int nSearchResultCnt(SearchItem sc) throws Exception;
	
	//공지사항
	List<BoardDto> nSearchSelectPage(SearchItem sc) throws Exception;
	
	//이벤트-행사 게시판 리스트 
	List<BoardDto> eSelectPage (SearchItem sc) throws Exception;
	
	//이벤트-행사 총 게시물 개수
	int eSearchResultCnt(SearchItem sc) throws Exception;
	
	//이벤트-행사
	List<BoardDto> eSearchSelectPage(SearchItem sc) throws Exception;
	
	//상세보기 
	BoardDto postSelect(Integer article_id) throws Exception;
	
	BoardDto movePage(Integer article_id) throws Exception;

	


}
