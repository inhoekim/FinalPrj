package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OttHomeController {
	@GetMapping("/autoMatch")
	public String home() {
		return "automatching/home.tiles";
	}
}
