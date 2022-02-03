package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.PartyVo;

import data.mybatis.mapper.PartyMapper;

@Service
public class PartyService {
	@Autowired PartyMapper mapper;
	
	public int createParty() {
		return mapper.createParty();
	}
	
	public PartyVo getMyParty(int ott_id) {
		return mapper.getMyParty(ott_id);
	}
}
