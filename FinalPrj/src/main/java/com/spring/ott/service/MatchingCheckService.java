package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.PartyMapper;
import data.mybatis.mapper.WatingRoomMapper;

@Service
public class MatchingCheckService {
	@Autowired PartyMapper partyMapper;
	@Autowired MatchingMapper matchingMapper;
	@Autowired WatingRoomMapper watingRoomMapper;
	
	public int matchingCheck(String user_id) {
		if(partyMapper.matchingCheck(user_id) != null) {
			return 1;
		}
		if(matchingMapper.matchingCheck(user_id) != null) {
			return 2;
		}
		if(watingRoomMapper.matchingCheck(user_id) != null) {
			return 3;
		}
		return 0;
	}
}
