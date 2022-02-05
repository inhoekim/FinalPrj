package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.PartyVo;

import data.mybatis.mapper.PartyMapper;

@Service
public class PartyService {
	@Autowired PartyMapper mapper;
	
	public int insertParty(PartyVo vo) {
		return mapper.insertParty(vo);
	}
	
	public PartyVo getMyParty(int ott_id) {
		return mapper.getMyParty(ott_id);
	}
	
	public PartyVo checkParty(String invite_code) {
		return mapper.checkParty(invite_code);
	}
}
