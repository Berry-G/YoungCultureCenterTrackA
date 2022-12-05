package com.youngtvjobs.ycc.member;

import java.util.Date;
import java.util.Objects;



public class MemberDto
{
	/**
	 * 
	 *     user_id    character(16) NOT NULL,
    user_name    character(25) NOT NULL,
    user_pw    character(16) NOT NULL,
    user_gender    character(1) NOT NULL,
    user_birth_date    date NOT NULL,
    user_email    character(50) NOT NULL,
    user_phone_number    character(11) NOT NULL,
    user_addr    character varying(100),
    user_regdate    date NOT NULL,
    user_grade    character(10) DEFAULT '일반회원' NOT NULL,
    user_social_type    character(1) NOT NULL
	 */
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_gender;
	private String birthYear;
	private String birthMonth;
	private String birthDay;
	private Date user_birth_date;
	private String user_email;
	private String user_phone_number;
	private String user_postcode;
	private String user_rNameAddr;
	private String user_detailAddr;
	private Date user_regdate;
	private String user_grade;
	private String user_social_type;
	

	
	public MemberDto(){
		// TODO Auto-generated constructor stub
	}
	


	public MemberDto(String user_id, String user_name, String user_pw, String user_gender, String birthYear,
			String birthMonth, String birthDay, Date user_birth_date, String user_email, String user_phone_number,
			String user_postcode, String user_rNameAddr, String user_detailAddr, Date user_regdate, String user_grade,
			String user_social_type) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_gender = user_gender;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.birthDay = birthDay;
		this.user_birth_date = user_birth_date;
		this.user_email = user_email;
		this.user_phone_number = user_phone_number;
		this.user_postcode = user_postcode;
		this.user_rNameAddr = user_rNameAddr;
		this.user_detailAddr = user_detailAddr;
		this.user_regdate = user_regdate;
		this.user_grade = user_grade;
		this.user_social_type = user_social_type;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_gender() {
		return user_gender;
	}



	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}



	public String getBirthYear() {
		return birthYear;
	}



	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}



	public String getBirthMonth() {
		return birthMonth;
	}



	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}



	public String getBirthDay() {
		return birthDay;
	}



	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}



	public Date getUser_birth_date() {
		return user_birth_date;
	}



	public void setUser_birth_date(Date user_birth_date) {
		this.user_birth_date = user_birth_date;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_phone_number() {
		return user_phone_number;
	}



	public void setUser_phone_number(String user_phone_number) {
		this.user_phone_number = user_phone_number;
	}



	public String getUser_postcode() {
		return user_postcode;
	}



	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}



	public String getUser_rNameAddr() {
		return user_rNameAddr;
	}



	public void setUser_rNameAddr(String user_rNameAddr) {
		this.user_rNameAddr = user_rNameAddr;
	}



	public String getUser_detailAddr() {
		return user_detailAddr;
	}



	public void setUser_detailAddr(String user_detailAddr) {
		this.user_detailAddr = user_detailAddr;
	}



	public Date getUser_regdate() {
		return user_regdate;
	}



	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}



	public String getUser_grade() {
		return user_grade;
	}



	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}



	public String getUser_social_type() {
		return user_social_type;
	}



	public void setUser_social_type(String user_social_type) {
		this.user_social_type = user_social_type;
	}



	@Override
	public int hashCode() {
		return Objects.hash(birthDay, birthMonth, birthYear, user_birth_date, user_detailAddr, user_email, user_gender,
				user_grade, user_id, user_name, user_phone_number, user_postcode, user_pw, user_rNameAddr, user_regdate,
				user_social_type);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDto other = (MemberDto) obj;
		return Objects.equals(birthDay, other.birthDay) && Objects.equals(birthMonth, other.birthMonth)
				&& Objects.equals(birthYear, other.birthYear) && Objects.equals(user_birth_date, other.user_birth_date)
				&& Objects.equals(user_detailAddr, other.user_detailAddr)
				&& Objects.equals(user_email, other.user_email) && Objects.equals(user_gender, other.user_gender)
				&& Objects.equals(user_grade, other.user_grade) && Objects.equals(user_id, other.user_id)
				&& Objects.equals(user_name, other.user_name)
				&& Objects.equals(user_phone_number, other.user_phone_number)
				&& Objects.equals(user_postcode, other.user_postcode) && Objects.equals(user_pw, other.user_pw)
				&& Objects.equals(user_rNameAddr, other.user_rNameAddr)
				&& Objects.equals(user_regdate, other.user_regdate)
				&& Objects.equals(user_social_type, other.user_social_type);
	}






	
	
	}	

