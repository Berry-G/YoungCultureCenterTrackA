package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	
	//게시글 리스트
	List<BoardDto> selectPage(SearchItem sc) throws Exception;
	
	int searchResultCnt(SearchItem sc) throws Exception;

	List<BoardDto> searchSelectPage(SearchItem sc) throws Exception;

	
	
}
