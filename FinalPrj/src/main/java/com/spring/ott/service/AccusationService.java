package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.AccusationVo;

import data.mybatis.mapper.AccusationMapper;

@Service
public class AccusationService {
	@Autowired AccusationMapper mapper;
	public List<AccusationVo> selectList(HashMap<String, Object> map){
		return mapper.selectList(map);
	}
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	
	public int postAccusation(AccusationVo vo) {
		return mapper.postAccusation(vo);
	}
	
}
