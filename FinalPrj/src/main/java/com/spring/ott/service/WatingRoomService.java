package com.spring.ott.service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.WatingRoomVo;

import data.mybatis.mapper.WatingRoomMapper;

@Service
public class WatingRoomService {
	@Autowired WatingRoomMapper mapper;
	
	public List<WatingRoomVo> getWatingRow(int ott_id){
		return mapper.getWatingRow(ott_id);
	}
	
	public int deleteRow(String user_id) {
		return mapper.deleteRow(user_id);
	}
	
	public int enroll(HashMap<String, Object> map) {
		return mapper.enroll(map);
	}
	
	public WatingRoomVo matchingCheck(String user_id) {
		return mapper.matchingCheck(user_id);
	}
	
	public int enrollFirst(HashMap<String, Object> map) {
		return mapper.enrollFirst(map);
	}
	
	public Date earliestDate() {
		return mapper.earliestDate();
	}
}
