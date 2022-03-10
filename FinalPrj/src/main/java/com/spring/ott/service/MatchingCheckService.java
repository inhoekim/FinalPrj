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
	@Autowired RedisWatingRoomService redisWatingRoomService;
	
	public HashMap<Integer,Object> matchingCheck(String user_id) {
		HashMap<Integer,Object> map = new HashMap<Integer, Object>();
		PartyVo partyVo = partyMapper.matchingCheck(user_id);
		MatchingVo matchingVo = matchingMapper.matchingCheck(user_id);
		int ott_id = redisWatingRoomService.checkUser(user_id);
		if(partyVo != null) {
			map.put(1, partyVo);
			return map;
		}
		if(matchingVo != null) {
			map.put(2, matchingVo);
			return map;
		}
		if(ott_id != -1) {
			WatingRoomVo watingRoomVo = new WatingRoomVo();
			watingRoomVo.setUser_id(user_id);
			watingRoomVo.setOtt_id(ott_id);
			map.put(3, watingRoomVo);
			return map;
		}
		map.put(0, true);
		return map;
	}
}
