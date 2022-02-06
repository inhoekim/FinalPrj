package com.spring.ott.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.WatingRoomVo;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.PartyMapper;
import data.mybatis.mapper.WatingRoomMapper;

@Service
public class MatchingCheckService {
	@Autowired PartyMapper partyMapper;
	@Autowired MatchingMapper matchingMapper;
	@Autowired WatingRoomMapper watingRoomMapper;
	
	public HashMap<Integer,Object> matchingCheck(String user_id) {
		HashMap<Integer,Object> map = new HashMap();
		PartyVo partyVo = partyMapper.matchingCheck(user_id);
		MatchingVo matchingVo = matchingMapper.matchingCheck(user_id);
		WatingRoomVo watingRoomVo = watingRoomMapper.matchingCheck(user_id);
		if(partyVo != null) {
			map.put(1, partyVo);
			return map;
		}
		if(matchingVo != null) {
			map.put(2, matchingVo);
			return map;
		}
		if(watingRoomVo != null) {
			map.put(3, watingRoomVo);
			return map;
		}
		map.put(0, true);
		return map;
	}
}
