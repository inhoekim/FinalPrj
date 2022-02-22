package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.ott.vo.PayMentVo;
import data.mybatis.mapper.PayMentMapper;

public interface PayMentService {
	boolean PayInsert(PayMentVo vo, int party_id);
	List<PayMentVo> PayList(HashMap<String, Integer> map);
	int totalRowCnt();
	List<PayMentVo> AllSelect();
	boolean payupdate(String payment_id);
	PayMentVo tidSelect(String payment_id);
}
