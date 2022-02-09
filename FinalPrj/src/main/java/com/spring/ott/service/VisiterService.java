package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.VisiterVo;

import data.mybatis.mapper.VisiterMapper;

@Service
public class VisiterService {
	@Autowired private VisiterMapper mapper;
	
	public int inservisiter(String ip_address) {
		return mapper.insert(ip_address);
	}
	
	public List<VisiterVo> onedayselect(String visit_date) {
		return mapper.onedayselect(visit_date);
	}
	public List<VisiterVo> rankingselect(String visit_date) {
		return mapper.rankingselect(visit_date);
	}
	public int onedaylog(String visit_date) {
		return mapper.onedaylog(visit_date);
	}
}
