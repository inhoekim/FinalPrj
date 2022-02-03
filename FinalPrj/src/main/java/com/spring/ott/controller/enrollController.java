package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.MatchingService;
import com.spring.ott.service.PartyService;
import com.spring.ott.service.WatingRoomService;
import com.spring.ott.vo.PartyVo;

@Controller
public class enrollController {
	@Autowired PartyService partyService;
	@Autowired WatingRoomService watingService;
	@Autowired MatchingService matchinService;
	
	@PostMapping("/autoMatch/matching/enroll")
	public String enroll(Principal principal, int ott_id) {
		PartyVo myParty = partyService.getMyParty(ott_id);
		//Wating 테이블에 등록
		if(myParty == null) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("user_id", principal.getName());
			map.put("ott_id", ott_id);
			watingService.enroll(map);
		//해당 Party에 추가
		}else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("party_id", myParty.getParty_id());
			map.put("user_id", principal.getName());
			matchinService.insert(map);
			//핸드폰 알림기능(예정)
		}

		
		return "automatching/matching.tiles";
	}
}
