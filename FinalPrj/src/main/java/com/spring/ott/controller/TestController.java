package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.ErollPartyService;

@Controller
public class TestController {
	
	@GetMapping("/inhoe/test")
	public String test() {
		return "redirect:/home";
	}
}
