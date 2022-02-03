package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.PartyService;
import com.spring.ott.vo.PartyVo;

@Controller
public class CreatyPartyController {
	@Autowired PartyService partyService;
	
	@GetMapping("/autoMatch/matching/createParty")
	public String creatyPartyForm() {
		return "automatching/creatyPartyForm.tiles";
	}
	@PostMapping("/autoMatch/matching/createParty")
	public String creatyParty(PartyVo vo) {
		partyService.createParty(vo);
		return "";
	}
}
