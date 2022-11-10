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
	private Date user_birth_date;
	private String user_email;
	private String user_phone_number;
	private String user_addr;
	private Date user_regdate;
	private String user_grade;
	private String user_social_type;
	
	public MemberDto()
	{
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String user_id, String user_name, String user_pw, String user_gender, Date user_birth_date,
			String user_email, String user_phone_number, String user_addr, Date user_regdate, String user_grade,
			String user_social_type)
	{
		// super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_gender = user_gender;
		this.user_birth_date = user_birth_date;
		this.user_email = user_email;
		this.user_phone_number = user_phone_number;
		this.user_addr = user_addr;
		this.user_regdate = user_regdate;
		this.user_grade = user_grade;
		this.user_social_type = user_social_type;
	}

	@Override
	public int hashCode()
	{
		return Objects.hash(user_addr, user_birth_date, user_email, user_gender, user_grade, user_id, user_name,
				user_phone_number, user_pw, user_regdate, user_social_type);
	}

	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDto other = (MemberDto) obj;
		return Objects.equals(user_addr, other.user_addr) && Objects.equals(user_birth_date, other.user_birth_date)
				&& Objects.equals(user_email, other.user_email) && Objects.equals(user_gender, other.user_gender)
				&& Objects.equals(user_grade, other.user_grade) && Objects.equals(user_id, other.user_id)
				&& Objects.equals(user_name, other.user_name)
				&& Objects.equals(user_phone_number, other.user_phone_number) && Objects.equals(user_pw, other.user_pw)
				&& Objects.equals(user_regdate, other.user_regdate)
				&& Objects.equals(user_social_type, other.user_social_type);
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getUser_name()
	{
		return user_name;
	}

	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}

	public String getUser_pw()
	{
		return user_pw;
	}

	public void setUser_pw(String user_pw)
	{
		this.user_pw = user_pw;
	}

	public String getUser_gender()
	{
		return user_gender;
	}

	public void setUser_gender(String user_gender)
	{
		this.user_gender = user_gender;
	}

	public Date getUser_birth_date()
	{
		return user_birth_date;
	}

	public void setUser_birth_date(Date user_birth_date)
	{
		this.user_birth_date = user_birth_date;
	}

	public String getUser_email()
	{
		return user_email;
	}

	public void setUser_email(String user_email)
	{
		this.user_email = user_email;
	}

	public String getUser_phone_number()
	{
		return user_phone_number;
	}

	public void setUser_phone_number(String user_phone_number)
	{
		this.user_phone_number = user_phone_number;
	}

	public String getUser_addr()
	{
		return user_addr;
	}

	public void setUser_addr(String user_addr)
	{
		this.user_addr = user_addr;
	}

	public Date getUser_regdate()
	{
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate)
	{
		this.user_regdate = user_regdate;
	}

	public String getUser_grade()
	{
		return user_grade;
	}

	public void setUser_grade(String user_grade)
	{
		this.user_grade = user_grade;
	}

	public String getUser_social_type()
	{
		return user_social_type;
	}

	public void setUser_social_type(String user_social_type)
	{
		this.user_social_type = user_social_type;
	}
	
	
}
