package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.SettleVo;

import data.mybatis.mapper.SettleMapper;

@Service
public class SettleService {
	@Autowired SettleMapper mapper;
	
	public int insert(SettleVo vo) {
		return mapper.insert(vo);
	}
	
	public SettleVo select(String target_id) {
		return mapper.select(target_id);
	}
}
