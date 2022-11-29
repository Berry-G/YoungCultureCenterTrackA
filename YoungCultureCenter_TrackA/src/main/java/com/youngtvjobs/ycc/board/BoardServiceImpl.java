package com.youngtvjobs.ycc.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	//글쓰기
	@Override
	public void writeInsert(BoardDto boardDto) throws Exception {
		boardDao.writeInsert(boardDto);
		
	}
	
	//삭제하기
	@Override
	public int remove(Integer article_id, String user_id) throws Exception {
		
		return boardDao.delete(article_id, user_id);
	}
	
	//공지사항 게시판 리스트 
	@Override
	public List<BoardDto> nSelectPage(SearchItem sc) throws Exception {
		return boardDao.nSelectPage(sc);
	}

	//공지사항
	@Override
	public int nSearchResultCnt(SearchItem sc) throws Exception {
		return boardDao.nSearchResultCnt(sc) ;
	}
	//공지사항 
	@Override
	public List<BoardDto> nSearchSelectPage(SearchItem sc) throws Exception {
		return boardDao.nSearchSelectPage(sc);
	}
	//이벤트-행사 게시판 리스트
	@Override
	public List<BoardDto> eSelectPage(SearchItem sc) throws Exception {
		return boardDao.eSearchSelectPage(sc);
	}

	//이벤트-행사
	@Override
	public int eSearchResultCnt(SearchItem sc) throws Exception {
		return boardDao.eSearchResultCnt(sc);
	}
	//이벤트-행사
	@Override
	public List<BoardDto> eSearchSelectPage(SearchItem sc) throws Exception {
		return boardDao.eSearchSelectPage(sc);
	}
	//상세보기 
	@Override
	public BoardDto postSelect(Integer article_id) throws Exception {	
		BoardDto boardDto = boardDao.postSelect(article_id);
		boardDao.PlusViewCnt(article_id);
		return boardDto;
	}

	@Override
	public BoardDto movePage(Integer article_id) throws Exception {
		return boardDao.movePage(article_id);
	}

	

	

	
	
	
	
}
