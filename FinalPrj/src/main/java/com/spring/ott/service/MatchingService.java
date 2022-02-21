package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.MemberVo;

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
	
	public int deleteAll(int party_id) {
		return mapper.deleteAll(party_id);
	}
	
	public MatchingVo matchingCheck(String user_id) {
		return mapper.matchingCheck(user_id);
	}
	
	public List<MatchingVo> memberList(int party_id) {
		return mapper.memberList(party_id);
	}
	
	public List<MemberVo> selectMember(int party_id) {
		return mapper.selectMember(party_id);
	}
	
	public MatchingVo selectByPayment(String payment_id) {
		return mapper.selectByPayment(payment_id);
	}
}
