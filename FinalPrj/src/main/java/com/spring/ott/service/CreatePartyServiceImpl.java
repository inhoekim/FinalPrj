package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ott.vo.OttVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;
import com.spring.ott.vo.WatingRoomVo;

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
	
	@Override
	@Transactional
	public boolean createParty(PartyVo PartyVo, SettleVo settleVo){
		//파티테이블 row 등록
		partyMapper.insertParty(PartyVo);
		OttVo ottVo = ottMapper.selectOtt(PartyVo.getOtt_id());
		//정산테이블 row 등록
		settleVo.setPrice((ottVo.getMonth_price() / 4) * 3);
		settleVo.setParty_id(PartyVo.getParty_id());
		settleMapper.insert(settleVo);
		//watingTable 인원 가져오기
		List<WatingRoomVo> wr_list = wrMapper.getWatingRow(PartyVo.getOtt_id());
		return true;
	}
}
