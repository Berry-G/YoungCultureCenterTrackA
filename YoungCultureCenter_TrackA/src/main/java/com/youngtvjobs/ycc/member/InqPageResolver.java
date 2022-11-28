package com.youngtvjobs.ycc.member;

import static java.lang.Math.max;
import static java.lang.Math.min;
import static java.util.Objects.requireNonNullElse;

import org.springframework.web.util.UriComponentsBuilder;


public class InqPageResolver {
	
	public static final Integer DEFAULT_PAGE_SIZE = 6;
	public static final Integer MIN_PAGE_SIZE = 5;
	public static final Integer MAX_PAGE_SIZE = 50;
	
	private int totalCnt;			//게시물 총 개수
	private int pageSize;		//한 페이지 당 게시물 개수
	public final int NAV_SIZE = 5; //page navigation size
	
	private int totalPage;			//전체 페이지 개수
	private int page;				//현재 페이지
	
	private int beginPage;			//화면에 보여줄 첫 페이지
	private int endPage;			//화면에 보여줄 마지막 페이지
	private boolean showNext = false; 	  //이후를 보여줄지 여부	(endPage==totalPage 이면 showNext는 false)
	private boolean showPrev = false; //이전을 보여줄지 여부	(beginPage==1 이 아니면 showPrev는 true)

	private Integer offset;
	
	public InqPageResolver() {
		// TODO Auto-generated constructor stub
	}

	/*
	 * public InqPageResolver(int pageSize, int page) {
	 * this(0,pageSize,page);
	 * this.offset = (page-1) *pageSize; }
	 */

	public InqPageResolver(int pageSize, int page) {
		//super();
		this.pageSize = pageSize;
		this.page = page;
		this.offset = (page-1) *pageSize;
	}

	public InqPageResolver(int totalCnt, int pageSize, int page) {
		super();
		this.totalCnt = totalCnt;
		this.pageSize = pageSize;
		this.page = page;
		
		
		doPaging(totalCnt, pageSize, page);
	}

	public void doPaging(int totalCnt, int pageSize, int page) {
		this.totalPage = totalCnt / getPageSize() + (totalCnt % getPageSize() == 0? 0 : 1);
		this.setPage(Math.min(getPage(), totalPage));
		this.beginPage = (this.getPage()-1) /NAV_SIZE * NAV_SIZE +1;
		this.endPage = Math.min(this.beginPage+this.NAV_SIZE-1, totalPage);
		this.showPrev = beginPage != 1;
		this.showNext = endPage != totalPage;
		this.offset = (page-1) *pageSize;
	}
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.build().toString();
	}

	public Integer getOffset() {
		int result = (page-1) *pageSize;
		if(result < 0) result=0;
		return result;
	}

	public int getTotalCnt() {
		return totalCnt;
	}



	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}



	public int getPageSize() {
		return pageSize;
	}



	//PAGESIZE SETTER
	public void setPageSize(Integer pageSize) {
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//PAGESIZE가 MIN MAX 사이값을 갖도록(둘중 작은값, 큰값)
		this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));
	}


	public int getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}



	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}



	public int getBeginPage() {
		return beginPage;
	}



	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public boolean isShowNext() {
		return showNext;
	}



	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}



	public boolean isShowPrev() {
		return showPrev;
	}



	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}



	public int getNAV_SIZE() {
		return NAV_SIZE;
	}

	@Override
	public String toString() {
		return "InqPageResolver [totalCnt=" + totalCnt + ", pageSize=" + pageSize + ", NAV_SIZE=" + NAV_SIZE
				+ ", totalPage=" + totalPage + ", page=" + page + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ ", showNext=" + showNext + ", showPrev=" + showPrev + ", offset=" + offset + "]";
	}
	

}