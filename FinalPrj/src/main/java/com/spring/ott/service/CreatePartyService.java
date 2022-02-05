package com.spring.ott.service;

import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;

public interface CreatePartyService {
	boolean createParty(PartyVo PartyVo, SettleVo settleVo);
}
