package com.spring.ott.service;

import java.util.HashMap;


public interface ErollPartyService {
	boolean enrollParty(HashMap<String, Object> map);
	boolean resignParty(HashMap<String, Object> map);
}


