package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPartyController {
	@GetMapping("/autoMatch/myParty")
	public String myParty() {
		return "home/myParty.tiles";
	}
}
