package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.AccusationVo;

import data.mybatis.mapper.AccusationMapper;

@Service
public class AccusationService {
	@Autowired AccusationMapper mapper;
	public List<AccusationVo> selectList(){
		return mapper.selectList();
	}
	public int postAccusation(AccusationVo vo) {
		return mapper.postAccusation(vo);
	}
	public int commentAccusation(AccusationVo vo) {
		return mapper.commentAccusation(vo);
	}
}
