package com.spring.ott.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.WatingRoomService;

@Controller
public class CancelMatchingController {
	@Autowired WatingRoomService service;
	
	@GetMapping("/autoMatch/cancelMatching")
	public String cancle(Principal principal) {
		service.deleteRow(principal.getName());
		return "redirect:/autoMatch/myParty";
	}
}
