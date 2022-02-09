package com.spring.ott.controller.csh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login() {
		return "home/home.tiles";
	}
	@GetMapping("/logout")
	public String logout() {
		return "logout";
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "home/login.tiles";
	}
}
