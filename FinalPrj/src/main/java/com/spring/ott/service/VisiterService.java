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
	public List<VisiterVo> alldayselect() {
		return mapper.alldayselect();
	}
	public List<VisiterVo> rankingselect(String visit_date) {
		return mapper.rankingselect(visit_date);
	}
	public int onedaylog(String visit_date) {
		return mapper.onedaylog(visit_date);
	}
	
	
	//멤버 차트
	public List<VisiterVo> membercount1() {
		return mapper.membercount1();
	}
	public List<VisiterVo> membercount2() {
		return mapper.membercount2();
	}
	public List<VisiterVo> membercount3() {
		return mapper.membercount3();
	}
	public List<VisiterVo> membercount4() {
		return mapper.membercount4();
	}
	public List<VisiterVo> membercount5(String visit_date,String visit_date1) {
		return mapper.membercount5(visit_date,visit_date1);
	}
	public List<VisiterVo> membercount6() {
		return mapper.membercount6();
	}
	public List<VisiterVo> membercount7() {
		return mapper.membercount7();
	}
}
