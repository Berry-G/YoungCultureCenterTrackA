package com.youngtvjobs.ycc.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.youngtvjobs.ycc.board.boardMapper.";
	
	//게시글 리스트
	@Override
	public List<BoardDto> selectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace +"selectPage", sc);
	}
	
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		System.out.println("얍");
		return session.selectOne(namespace + "searchResultCnt", sc);
	}

	@Override
	public List<BoardDto> searchSelectPage(SearchItem sc) throws Exception {
	
		return session.selectList(namespace + "searchSelectPage" , sc);
	}

	
}
