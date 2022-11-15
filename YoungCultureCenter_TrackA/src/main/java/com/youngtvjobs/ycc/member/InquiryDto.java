package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.Objects;

public class InquiryDto {

	private Integer inq_id;
	private MemberDto user_id;
	private String inq_cate;
	private String inq_title;
	private String inq_content;
	private Date inq_date;
	private boolean inq_YN;
	
	public InquiryDto() {
		// TODO Auto-generated constructor stub
	}

	public InquiryDto(Integer inq_id, MemberDto user_id, String inq_cate, String inq_title, String inq_content,
			Date inq_date, boolean inq_YN) {
		super();
		this.inq_id = inq_id;
		this.user_id = user_id;
		this.inq_cate = inq_cate;
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_date = inq_date;
		this.inq_YN = inq_YN;
	}

	
	@Override
	public int hashCode() {
		return Objects.hash(inq_YN, inq_cate, inq_content, inq_date, inq_id, inq_title, user_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InquiryDto other = (InquiryDto) obj;
		return inq_YN == other.inq_YN && Objects.equals(inq_cate, other.inq_cate)
				&& Objects.equals(inq_content, other.inq_content) && Objects.equals(inq_date, other.inq_date)
				&& Objects.equals(inq_id, other.inq_id) && Objects.equals(inq_title, other.inq_title)
				&& Objects.equals(user_id, other.user_id);
	}

	
	public Integer getInq_id() {
		return inq_id;
	}

	public void setInq_id(Integer inq_id) {
		this.inq_id = inq_id;
	}

	public MemberDto getUser_id() {
		return user_id;
	}

	public void setUser_id(MemberDto user_id) {
		this.user_id = user_id;
	}

	public String getInq_cate() {
		return inq_cate;
	}

	public void setInq_cate(String inq_cate) {
		this.inq_cate = inq_cate;
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
	

}
