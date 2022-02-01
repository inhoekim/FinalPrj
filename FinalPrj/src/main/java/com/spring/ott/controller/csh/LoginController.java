package com.spring.ott.controller.csh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login() {
		return "home/login.tiles";
	}
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
}
