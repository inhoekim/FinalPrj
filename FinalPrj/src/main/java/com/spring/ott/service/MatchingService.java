package com.spring.ott.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.MatchingMapper;

@Service
public class MatchingService {
	@Autowired MatchingMapper mapper;
	
	public int insert(HashMap<String, Object> map) {
		return mapper.insert(map);
	}
	
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
}
