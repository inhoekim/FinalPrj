package com.spring.ott.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.BlackListVo;

import data.mybatis.mapper.BlackListMapper;
import data.mybatis.mapper.UserMapper;

@Service
public class BlackListManiServiceImpl implements BlackListManiService{
	@Autowired BlackListMapper bMapper;
	@Autowired UserMapper uMapper;

	@Transactional
	@Override
	public int enrollBlackList(String user_id, BlackListVo bVo) {
		//users 테이블 black_enabled=0 만들기
		uMapper.blackUser(user_id);
		bMapper.blackListInsert(bVo);
		
		return 1;
	}
	
	
}
