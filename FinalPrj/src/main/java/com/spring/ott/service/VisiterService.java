package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.VisiterVo;

import data.mybatis.mapper.VisiterMapper;

@Service
public class VisiterService {
	@Autowired private VisiterMapper mapper;
	
	public int inservisiter(String ip_address) {
		System.out.println("테스트입니다!");
		return mapper.insert(ip_address);
		
	}
}
