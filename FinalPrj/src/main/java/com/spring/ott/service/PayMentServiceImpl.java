package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.PayMentVo;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.PartyMapper;
import data.mybatis.mapper.PayMentMapper;

@Service
public class PayMentServiceImpl implements PayMentService{
	@Autowired PayMentMapper mapper;
	@Autowired MatchingMapper matchingMapper;
	@Autowired PartyMapper partyMapper;
	
	//Payment 테이블 Insert -> Matching 테이블 결제정보 Update (트랜잭션 처리) 
	@Transactional
	public boolean PayInsert(PayMentVo vo, int party_id) {
		//payment테이블에 결제정보 insert
		mapper.PayMentInsert(vo);
		//matching테이블에 결제정보 update
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("payment_id", vo.getPayment_id());
		map.put("user_id", vo.getUser_id());
		map.put("party_id", party_id);
		matchingMapper.updatePayment(map);
		//파티상태 변경 확인 (모든 파티원이 payment가 존재할때 파티 state를 1로 변경)
		PartyVo partyVo = partyMapper.selectParty(party_id);
		if(partyVo.getMember_num() == 3 && partyMapper.checkPaymentState() == 3) {
			map.put("party_state", 1);
			partyMapper.stateUpdate(map);
		}
		return true;
	}
	//Payment 테이블 Update -> Matching 테이블 결제정보 Update (트랜잭션 처리) 
	@Transactional
	public boolean payupdate(String payment_id) {
		//Payment 테이블에 취소내역 Update
		mapper.payupdate(payment_id);
		//Matching테이블에 결제취소 update(payment_id를 null값으로 등록)
		MatchingVo matchVo =  matchingMapper.selectByPayment(payment_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("payment_id", "");
		map.put("user_id", matchVo.getUser_id());
		map.put("party_id", matchVo.getParty_id());
		matchingMapper.updatePayment(map);
		return true;
	}
	
	public List<PayMentVo> PayList(HashMap<String, Integer> map){
		return mapper.PayList(map);
	}
	
	public int totalRowCnt() {
		return mapper.totalRowCnt();
	}
	
	public List<PayMentVo> AllSelect(){
		return mapper.AllSelect();
	}
	
	public PayMentVo tidSelect(String payment_id) {
		return mapper.tidSelect(payment_id);
	}
	
}
