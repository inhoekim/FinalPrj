package com.spring.ott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProfileController {

	@GetMapping("/profile/{user_id}")
	public String profile(@PathVariable("user_id") String user_id) {
		
		return "board/profile.tiles";
	}
}
