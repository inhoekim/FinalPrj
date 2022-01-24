package com.spring.ott.security.csh;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.ott.vo.AuthoritiesVo;

public class FinalUserDetail implements UserDetails{
	private String user_id;
	private String pwd;
	private String enabled;
	private List<AuthoritiesVo> authList;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities(){
		ArrayList<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();
		for(AuthoritiesVo vo:authList) {
			auths.add(new SimpleGrantedAuthority(vo.getAutority()));
		}
		return auths;
	}

	@Override
	public String getPassword() {return pwd;}

	@Override
	public String getUsername() {return user_id;}

	@Override
	public boolean isAccountNonExpired() {return true;}

	@Override
	public boolean isAccountNonLocked() {return true;}

	@Override
	public boolean isCredentialsNonExpired() {return true;}

	@Override
	public boolean isEnabled() {return true;}
	
}
