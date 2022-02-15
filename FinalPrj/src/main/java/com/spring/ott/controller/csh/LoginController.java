package com.spring.ott.controller.csh;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("login",true);
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

