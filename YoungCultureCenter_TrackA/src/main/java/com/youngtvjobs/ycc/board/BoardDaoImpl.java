package com.youngtvjobs.ycc.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.youngtvjobs.ycc.board.boardMapper.";
	//글쓰기
	@Override
	public void writeInsert(BoardDto boardDto) throws Exception {
		session.insert(namespace + "writeInsert", boardDto);
	}
	//공지사항 게시글 리스트
	@Override
	public List<BoardDto> nSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace +"nSelectPage", sc);
	}
	//공지사항
	@Override
	public int nSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "nSearchResultCnt", sc);
	}
	//공지사항 
	@Override
	public List<BoardDto> nSearchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "nSearchSelectPage" , sc);
	}
	//이벤트 게시글 리스트
	@Override
	public List<BoardDto> eSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "eSelectPage", sc);
	}
	
	//이벤트-행사
	@Override
	public int eSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "eSearchResultCnt", sc);
	}
	//이벤트-행사
	@Override
	public List<BoardDto> eSearchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "eSearchSelectPage", sc);
	}
	//상세보기
	@Override
	public BoardDto postSelect(Integer article_id) throws Exception {
		return session.selectOne(namespace + "postSelect", article_id );
	}
	//조회수증가
	@Override
	public int PlusViewCnt(Integer article_id) throws Exception {
		return session.update(namespace + "PlusViewCnt" , article_id);
	}
	//이전글
	@Override
	public BoardDto preView(int preView) throws Exception {
		return session.selectOne(namespace + "preView", preView);
	}
	//다음글
	@Override
	public BoardDto nextView(int nextView) throws Exception {
		return session.selectOne(namespace + "nextView", nextView);
	}
	//게시글 삭제 
	@Override
	public int postDelete(Integer article_id) throws Exception {
		return session.delete(namespace + "postDelete", article_id);
	}


	
}
