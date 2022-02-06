package com.spring.ott.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.MatchingCheckService;

@Controller
public class MyPartyController {
	@Autowired MatchingCheckService matchingCheckService;
	
	@GetMapping("/autoMatch/myParty")
	public String myParty(Principal principal) {
		int page = matchingCheckService.matchingCheck(principal.getName());
		if(page == 1) {
			return "automatching/myPartyLeader.tiles";
		}else if (page == 2) {
			return "automatching/myParty.tiles";
		}else if (page == 3) {
			return "automatching/wating.tiles";
		}
		return "automatching/startMatching.tiles";
	}
}
