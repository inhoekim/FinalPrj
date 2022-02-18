package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.ProfileImgVo;
import com.spring.ott.vo.UserProfileVo;

import data.mybatis.mapper.ProfileImgMapper;

@Service
public class ProfileImgService {
	@Autowired ProfileImgMapper mapper; 
	
	public ProfileImgVo selectProfile(int profile_id) {
		return mapper.selectProfile(profile_id);
	}
	
	public UserProfileVo userProfile(String user_id) {
		return mapper.userProfile(user_id);
	}
}
