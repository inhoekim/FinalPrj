package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;
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
	
	public List<PayMentVo> PayList(HashMap<String, Integer> map){
		return mapper.PayList(map);
	}
	
	public int totalRowCnt() {
		return mapper.totalRowCnt();
	}
	
	public List<PayMentVo> AllSelect(){
		return mapper.AllSelect();
	}
	
	public int payupdate(String payment_id) {
		return mapper.payupdate(payment_id);
	}
	
}
