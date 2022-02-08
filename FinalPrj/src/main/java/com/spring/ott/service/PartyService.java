package com.spring.ott.service;

import java.util.HashMap;

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
	
	public PartyVo checkInvite(String invite_code) {
		return mapper.checkInvite(invite_code);
	}
	
	public PartyVo matchingCheck(String user_id) {
		return mapper.matchingCheck(user_id);
	}
	
	public PartyVo selectParty(int party_id) {
		return mapper.selectParty(party_id);
	}
	
	public int memberUpdate(HashMap<String,Object> map) {
		return mapper.memberUpdate(map);
	}
}
