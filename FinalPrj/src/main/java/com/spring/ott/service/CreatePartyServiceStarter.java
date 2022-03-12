package com.spring.ott.service;

import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;

public interface CreatePartyServiceStarter {
	boolean createParty(PartyVo partyVo, SettleVo settleVo);
}
