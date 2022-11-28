package com.youngtvjobs.ycc.board;

import java.util.List;

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
	//이전글
	@Override
	public BoardDto preView(int preView) throws Exception {
		return boardDao.preView(preView);
	}
	//다음글
	@Override
	public BoardDto nextView(int nextView) throws Exception {
		return boardDao.nextView(nextView);
	}

	@Override
	public int postDelete(Integer article_id) throws Exception {
		return boardDao.postDelete(article_id);
	}






	
	
}
