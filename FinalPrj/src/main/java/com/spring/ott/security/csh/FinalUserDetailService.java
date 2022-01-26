package com.spring.ott.security.csh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.spring.ott.service.UserService;

public class FinalUserDetailService implements UserDetailsService{
	@Autowired private UserService service;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		FinalUserDetail userDetail=service.getAuths(user_id);
		return userDetail;
	}

}
