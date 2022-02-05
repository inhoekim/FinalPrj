package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.OttVo;

import data.mybatis.mapper.OttMapper;

@Service
public class OttService {
	@Autowired OttMapper mapper; 
	
	public OttVo selectOtt(int ott_id) {
		return mapper.selectOtt(ott_id);
	}
}
