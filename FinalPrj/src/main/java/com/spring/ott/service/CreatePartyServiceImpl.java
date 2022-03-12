package com.spring.ott.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.OttVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;
import com.spring.ott.vo.WatingRoomVo;

import data.mybatis.mapper.MatchingMapper;
import data.mybatis.mapper.OttMapper;
import data.mybatis.mapper.PartyMapper;
import data.mybatis.mapper.SettleMapper;
import data.mybatis.mapper.WatingRoomMapper;


@Service
public class CreatePartyServiceImpl implements CreatePartyService{
	@Autowired PartyMapper partyMapper;
	@Autowired SettleMapper settleMapper;
	@Autowired OttMapper ottMapper; 
	@Autowired WatingRoomMapper wrMapper;
	@Autowired MatchingMapper matchingMapper;
	@Autowired RedisWatingRoomService redisWatingRoomService;
		
	@Override
	@Transactional
	public boolean createPartyOracle(PartyVo partyVo, SettleVo settleVo, int mem_num, List<HashMap<String,Object>> mapList){
		//파티테이블 row 등록
		partyMapper.insertParty(partyVo);
		OttVo ottVo = ottMapper.selectOtt(partyVo.getOtt_id());
		//정산테이블 row 등록
		settleVo.setPrice((ottVo.getMonth_price() / 4) * 3);
		settleVo.setParty_id(partyVo.getParty_id());
		settleMapper.insert(settleVo);

		//watingTable에서 MatchingTable로 이동
		mapList.forEach(map -> {
			map.put("party_id", partyVo.getParty_id());
			matchingMapper.insert(map);
		});		
		//party의 member_num 칼럼 Update
		HashMap<String,Object> map = new HashMap<>();
		map.put("party_id", partyVo.getParty_id());
		map.put("input_num", mem_num);
		partyMapper.memberUpdate(map);
		return true;
	}
	
	@Override
	@Transactional
	public List<HashMap<String,Object>> createPartyRedis(PartyVo partyVo, List<String> wr_list) {
		List<HashMap<String,Object>> maplist = new ArrayList<HashMap<String,Object>>();
		wr_list.forEach(userId -> {
			//watingTable 유저 꺼내오기
			HashMap<String,Object> map = new HashMap<>();
			
			map.put("user_id", userId);
			maplist.add(map);
			//watingTable에서 삭제
			//wrMapper.deleteRow(watingUser);
			redisWatingRoomService.popWatingUser(wr_list.size(), partyVo.getOtt_id());
			redisWatingRoomService.removeWatingUser(userId, partyVo.getOtt_id());
		});
		return maplist;
	}
}

@Service
class CreatePartyServiceStarterImpl implements CreatePartyServiceStarter{
	@Autowired CreatePartyService createPartyService;
	@Autowired RedisWatingRoomService redisWatingRoomService;
	
	@Override
	public boolean createParty(PartyVo partyVo, SettleVo settleVo) {
		//watingTable 인원 가져오기
		//List<WatingRoomVo> wr_list = wrMapper.getWatingRow(PartyVo.getOtt_id());
		List<String> wr_list = redisWatingRoomService.getWatingUser(partyVo.getOtt_id());
		List<HashMap<String,Object>> mapList = createPartyService.createPartyRedis(partyVo, wr_list);
		createPartyService.createPartyOracle(partyVo, settleVo, wr_list.size(), mapList);
		return true;
	}
	
}

