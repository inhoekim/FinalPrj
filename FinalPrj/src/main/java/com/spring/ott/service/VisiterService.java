package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.VisiterVo;

import data.mybatis.mapper.VisiterMapper;

@Service
public class VisiterService {
	@Autowired private VisiterMapper mapper;
	
	public int ipinsert(String ip_address) {
		return mapper.ipinsert(ip_address);
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
	public List<VisiterVo> memberstatus() {
		return mapper.memberstatus();
	}
	public List<VisiterVo> memberage() {
		return mapper.memberage();
	}
	public List<VisiterVo> DayCount(String visit_date) {
		return mapper.DayCount(visit_date);
	}
	
	
	//결제 차트
	public List<VisiterVo> Pay7CanCel(String payment_date) {
		return mapper.Pay7CanCel(payment_date);
	}
	public List<VisiterVo> Pay7OK(String payment_date) {
		return mapper.Pay7OK(payment_date);
	}
	public List<VisiterVo> Pay7ALL(String payment_date) {
		return mapper.Pay7ALL(payment_date);
	}
	public List<VisiterVo> Pay7final(String payment_date) {
		return mapper.Pay7final(payment_date);
	}
}
