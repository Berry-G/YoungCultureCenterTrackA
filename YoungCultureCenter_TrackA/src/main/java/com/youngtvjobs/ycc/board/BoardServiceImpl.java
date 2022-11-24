package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	//게시판 리스트 
	@Override
	public List<BoardDto> listPage(SearchItem sc) throws Exception {
		return boardDao.selectPage(sc);
	}

	
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		return boardDao.searchResultCnt(sc) ;
	}

	@Override
	public List<BoardDto> searchSelectPage(SearchItem sc) throws Exception {
		return boardDao.searchSelectPage(sc);

	}


	
	
}
