package com.spring.ott.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.PartyMapper;

@Service
public class ErollPartyServiceImpl implements ErollPartyService{
	@Autowired MatchingMapper matchingMapper;
	@Autowired PartyMapper partyMapper;
	
	@Override
	@Transactional
	public boolean enrollParty(HashMap<String, Object> map) {
		//party에 멤버추가
		matchingMapper.insert(map);
		//party member_num 칼럼 업데이트
		partyMapper.memberUpdate(map);
		return true;
	}
	
	@Transactional
	public boolean resignParty(HashMap<String, Object> map) {
		//party에 멤버삭제
		matchingMapper.delete(map);
		//party member_num 칼럼 업데이트
		partyMapper.memberUpdate(map);
		return true;
	}

}
