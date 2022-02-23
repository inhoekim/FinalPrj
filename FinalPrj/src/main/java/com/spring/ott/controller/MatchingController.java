package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.PartyService;

@Controller
public class MatchingController {
	@Autowired PartyService partyService;
	
	@GetMapping("/autoMatch/matching")
	public String matchingPage(Model m) {
		m.addAttribute("weekNum", partyService.weekMatching());
		return "automatching/matching.tiles";
	}
}
