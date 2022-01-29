package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.PayMentVo;

import data.mybatis.mapper.PayMentMapper;

@Service
public class PayMentService {
	@Autowired PayMentMapper mapper;
	
	public int PayInsert(PayMentVo vo) {
		return mapper.PayMentInsert(vo);
	}
}
