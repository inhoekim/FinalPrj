package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchingController {

	@GetMapping("/autoMatch/matching")
	public String matchingPage() {
		return "automatching/matching.tiles";
	}
}
