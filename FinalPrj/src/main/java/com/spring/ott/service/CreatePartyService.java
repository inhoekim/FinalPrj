package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;

public interface CreatePartyService {
	List<HashMap<String,Object>> createPartyRedis(PartyVo PartyVo, List<String> wr_list);
	boolean createPartyOracle(PartyVo partyVo, SettleVo settleVo, int mem_num, List<HashMap<String,Object>> mapList);
}
