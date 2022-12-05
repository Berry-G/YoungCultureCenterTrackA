package com.youngtvjobs.ycc.board;

import java.util.Date;
import java.util.Objects;

import org.springframework.web.util.UriComponentsBuilder;

public class BoardDto {

	//inq_board
	private String inq_cate;
	private Integer inq_id;
	private String inq_title;
	private String inq_content;
	private Date inq_date;
	private boolean inq_YN;

	//article
	private Integer article_id ;			// 번호PK
	private Date  article_date;				// 게시글 등록 날짜
	private String  article_Board_type;		// 게시글 유형
	private String user_id;					// 작성자
	private String  article_title;			// 제목
	private String article_contents;		// 내용
	private int  article_viewcnt;			// 조회수 
	private int preId;						// 이전글 no
	private int nextId;						// 다음글 no
	private String preTitle;				// 이전글 Title
	private String nextTitle;				// 다음글 Title
	private int count;
	
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}
 
	//article Constructor
	public BoardDto(Integer article_id, Date article_date, String article_Board_type, String user_id,
			String article_title, String article_contents, int article_viewcnt, int preId, int nextId, String preTitle,
			String nextTitle, int count) {
		super();
		this.article_id = article_id;
		this.article_date = article_date;
		this.article_Board_type = article_Board_type;
		this.user_id = user_id;
		this.article_title = article_title;
		this.article_contents = article_contents;
		this.article_viewcnt = article_viewcnt;
		this.preId = preId;
		this.nextId = nextId;
		this.preTitle = preTitle;
		this.nextTitle = nextTitle;
		this.count = count;
	}

	//inq_board Constructor
	public BoardDto(String inq_cate, Integer inq_id, String inq_title, String inq_content, Date inq_date,
			boolean inq_YN) {
		super();
		this.inq_cate = inq_cate;
		this.inq_id = inq_id;
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_date = inq_date;
		this.inq_YN = inq_YN;
	}
	
	//inq_board : getter, setter
	public String getInq_cate() {
		return inq_cate;
	}

	public void setInq_cate(String inq_cate) {
		this.inq_cate = inq_cate;
	}

	public Integer getInq_id() {
		return inq_id;
	}

	public void setInq_id(Integer inq_id) {
		this.inq_id = inq_id;
	}

	public String getInq_title() {
		return inq_title;
	}

	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}

	public String getInq_content() {
		return inq_content;
	}

	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}

	public Date getInq_date() {
		return inq_date;
	}

	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}

	public boolean isInq_YN() {
		return inq_YN;
	}

	public void setInq_YN(boolean inq_YN) {
		this.inq_YN = inq_YN;
	}

	
	//article : getter,setter
	public Integer getArticle_id() {
		return article_id;
	}


	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}


	public Date getArticle_date() {
		return article_date;
	}


	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}


	public String getArticle_Board_type() {
		return article_Board_type;
	}


	public void setArticle_Board_type(String article_Board_type) {
		this.article_Board_type = article_Board_type;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getArticle_title() {
		return article_title;
	}


	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}


	public String getArticle_contents() {
		return article_contents;
	}


	public void setArticle_contents(String article_contents) {
		this.article_contents = article_contents;
	}


	public int getArticle_viewcnt() {
		return article_viewcnt;
	}


	public void setArticle_viewcnt(int article_viewcnt) {
		this.article_viewcnt = article_viewcnt;
	}


	public int getPreId() {
		return preId;
	}


	public void setPreId(int preId) {
		this.preId = preId;
	}


	public int getNextId() {
		return nextId;
	}


	public void setNextId(int nextId) {
		this.nextId = nextId;
	}


	public String getPreTitle() {
		return preTitle;
	}


	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}


	public String getNextTitle() {
		return nextTitle;
	}


	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


}	