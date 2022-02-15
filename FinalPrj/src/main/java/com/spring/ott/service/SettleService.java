package com.spring.ott.service;

import java.util.HashMap;

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
	public SettleVo selectSettle(HashMap<String, Object> map) {
		return mapper.selectSettle(map);
	}
	
	public int cancleSettle(int party_id) {
		return mapper.cancleSettle(party_id);
	}
}
