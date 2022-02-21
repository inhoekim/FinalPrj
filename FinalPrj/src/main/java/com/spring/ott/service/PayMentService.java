package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.ott.vo.PayMentVo;
import data.mybatis.mapper.PayMentMapper;

public interface PayMentService {
	public boolean PayInsert(PayMentVo vo, int party_id);
	public List<PayMentVo> PayList(HashMap<String, Integer> map);
	public int totalRowCnt();
	public List<PayMentVo> AllSelect();
	public int payupdate(String payment_id);
}
