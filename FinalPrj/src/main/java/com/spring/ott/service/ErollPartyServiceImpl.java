package com.spring.ott.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.PartyVo;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.PartyMapper;
import data.mybatis.mapper.SettleMapper;
import data.mybatis.mapper.WatingRoomMapper;

@Service
public class ErollPartyServiceImpl implements ErollPartyService{
	@Autowired MatchingMapper matchingMapper;
	@Autowired PartyMapper partyMapper;
	@Autowired SettleMapper settleMapper;
	@Autowired WatingRoomMapper wrMapper;
	@Autowired RedisWatingRoomService redisWatingRoomService;
	
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
	
	@Transactional
	public boolean resignPartyLeader(int party_id, int ott_id, HashMap<String, Object> map) {
		//party state 칼럼 업데이트
		partyMapper.stateUpdate(map);
		//settle state 칼럼 업데이트
		settleMapper.cancleSettle(party_id);
		
		//party Member들 다시 WatingRoom으로 보내기(WatingRoom에서 가장 우선순위 부여)
		
		/*
		//우선순위를 부여를 위한 가장 이른 날짜 가져오기
		Calendar cal = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date earliest_Date = wrMapper.earliestDate();
		if(earliest_Date == null) {
			earliest_Date = new Date();
		}
		cal.setTime(earliest_Date);
		cal.add(Calendar.DATE, -1);
		*/
		//멤버리스트 가져오기
		List<MatchingVo> memberList = matchingMapper.memberList(party_id);
		//party Member들 watingRoom에 enrollFirst
		for(MatchingVo vo : memberList) {
			//적절한 파티를 찾아서 재등록
			PartyVo myParty = partyMapper.getMyParty(ott_id);
			if(myParty != null) {
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("party_id", myParty.getParty_id());
				map2.put("user_id", vo.getUser_id());
				map2.put("input_num", 1);
				map2.put("payment_id", vo.getPayment_id());
				matchingMapper.insert(map2);
				partyMapper.memberUpdate(map2);
				//유저의 이전 결제정보 업데이트
				if(vo.getPayment_id() != null) {
					matchingMapper.updatePayment(map2);
				}
			// 적절한 파티가 없을 시 WatingRoom에 재등록(우선순위 부여)
			}else {
				/*
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("user_id", vo.getUser_id());
				map2.put("ott_id", ott_id);
				map2.put("start_day", df.format(cal.getTime()));
				wrMapper.enrollFirst(map2);
				*/
				redisWatingRoomService.addWatingUser(vo.getUser_id(), ott_id);
			}
		}
		//이후 Matching테이블에서 멤버삭제
		matchingMapper.deleteAll(party_id);

		return true;
	}
}
