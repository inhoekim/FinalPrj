package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.BlackListVo;

import data.mybatis.mapper.BlackListMapper;

@Service
public class BlackListService {
	@Autowired BlackListMapper mapper; 
	
	public List<BlackListVo> blackList(){
		return mapper.blackList();
	}
}
