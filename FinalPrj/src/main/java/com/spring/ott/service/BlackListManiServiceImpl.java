package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.BlackListVo;
import com.spring.ott.vo.UserVo;

import data.mybatis.mapper.BlackListMapper;

@Service
public class BlackListManiServiceImpl implements BlackListManiService{
	@Autowired BlackListMapper mapper;

	@Transactional
	@Override
	public int blackListInsert(UserVo uVo, BlackListVo bVo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
