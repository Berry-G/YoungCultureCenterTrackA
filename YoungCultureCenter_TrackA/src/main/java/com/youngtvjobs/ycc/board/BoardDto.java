package com.youngtvjobs.ycc.board;

import java.util.Date;
import java.util.Objects;

public class BoardDto {
	
//	article_id   serial primary key,
//    article_date    timestamp without time zone NOT NULL,
//    article_Board_type    character(1) NOT NULL,
//    user_id    varchar(16) NOT NULL,
//    article_title    varchar NOT null,
//    article_contents    text NOT NULL,
//    article_viewcnt int not NULL
	
	
	private Integer article_id ;			// 번호PK
	private Date  article_date;				// 게시글 등록 날짜
	private String  article_Board_type;		// 게시글 유형
	private String user_id;					// 작성자
	private String  article_title;			// 제목
	private String article_contents;		// 내용
	private int  article_viewcnt;			// 조회수 
	private int preView;
	private int nextView;
	private String preTitle;
	private String nextTitle;
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}

	public BoardDto(Integer article_id, Date article_date, String article_Board_type, String user_id,
			String article_title, String article_contents, int article_viewcnt, int preView, int nextView,
			String preTitle, String nextTitle) {
		super();
		this.article_id = article_id;
		this.article_date = article_date;
		this.article_Board_type = article_Board_type;
		this.user_id = user_id;
		this.article_title = article_title;
		this.article_contents = article_contents;
		this.article_viewcnt = article_viewcnt;
		this.preView = preView;
		this.nextView = nextView;
		this.preTitle = preTitle;
		this.nextTitle = nextTitle;
	}

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

	public int getPreView() {
		return preView;
	}

	public void setPreView(int preView) {
		this.preView = preView;
	}

	public int getNextView() {
		return nextView;
	}

	public void setNextView(int nextView) {
		this.nextView = nextView;
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

	@Override
	public int hashCode() {
		return Objects.hash(article_Board_type, article_contents, article_date, article_id, article_title,
				article_viewcnt, nextTitle, nextView, preTitle, preView, user_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDto other = (BoardDto) obj;
		return Objects.equals(article_Board_type, other.article_Board_type)
				&& Objects.equals(article_contents, other.article_contents)
				&& Objects.equals(article_date, other.article_date) && Objects.equals(article_id, other.article_id)
				&& Objects.equals(article_title, other.article_title) && article_viewcnt == other.article_viewcnt
				&& Objects.equals(nextTitle, other.nextTitle) && nextView == other.nextView
				&& Objects.equals(preTitle, other.preTitle) && preView == other.preView
				&& Objects.equals(user_id, other.user_id);
	}

	
}