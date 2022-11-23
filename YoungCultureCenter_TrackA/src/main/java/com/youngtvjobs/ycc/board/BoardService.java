package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	//게시판 리스트 
	List<BoardDto> listPage (SearchItem sc) throws Exception;
	
	int searchResultCnt(SearchItem sc) throws Exception;
	
	List<BoardDto> searchSelectPage(SearchItem sc) throws Exception;
}
