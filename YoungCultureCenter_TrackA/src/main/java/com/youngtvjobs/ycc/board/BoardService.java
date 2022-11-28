package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	//글쓰기
	void writeInsert(BoardDto boardDto) throws Exception;
	
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
	
	//이전글
	BoardDto preView(int preView) throws Exception;
	
	//다음글
	BoardDto nextView(int nextView) throws Exception;
	
	//게시글 삭제 
	int postDelete(Integer article_id) throws Exception;
}
