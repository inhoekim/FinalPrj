package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.BlackListMapper;

@Service
public class BlackListManiServiceImpl implements BlackListManiService{
	@Autowired BlackListMapper mapper;
	
}
