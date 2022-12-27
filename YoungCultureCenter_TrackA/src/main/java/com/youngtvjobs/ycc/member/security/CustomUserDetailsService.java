package com.youngtvjobs.ycc.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.youngtvjobs.ycc.member.MemberDto;
import com.youngtvjobs.ycc.member.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
//유저의 로그인을 서비스로 구현하기 위해서 
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		
		
	    log.warn("Load User By UserName : " + user_id);
	    
	    MemberDto dto = null;
		try {
			dto = service.read(user_id);
			log.warn("querued by member mapper : " + dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto == null ? null : new CustomUser(dto);

	}

}
