package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	//CRUD(글쓰기, 읽기, 수정, 삭제)
	void writeInsert(BoardDto boardDto)throws Exception ;
	int delete(Integer article_id, String user_id) throws Exception;
	
	
	//공지사항 게시글 리스트
	List<BoardDto> nSelectPage(SearchItem sc) throws Exception;
	
	//공지사항
	int nSearchResultCnt(SearchItem sc) throws Exception;
	
	//공지사항 
	List<BoardDto> nSearchSelectPage(SearchItem sc) throws Exception;
	
	//이벤트 게시글 리스트
	List<BoardDto> eSelectPage(SearchItem sc) throws Exception;
	
	//이벤트-행사
	int eSearchResultCnt(SearchItem sc) throws Exception;
	
	//이벤트-행사
	List<BoardDto> eSearchSelectPage(SearchItem sc) throws Exception;

	//상세보기 
	BoardDto postSelect(Integer article_id) throws Exception;
	
	//조회수 증가 
	int PlusViewCnt(Integer article_id) throws Exception; 
	
	BoardDto movePage(Integer article_id) throws Exception;


	


	
}
