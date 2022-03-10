package com.spring.ott.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.RedisWatingRoomService;
import com.spring.ott.service.WatingRoomService;

@Controller
public class CancelMatchingController {
	@Autowired WatingRoomService service;
	@Autowired RedisWatingRoomService redisWatingRoomService;
	
	@GetMapping("/autoMatch/cancelMatching")
	public String cancle(Principal principal) {
		//service.deleteRow(principal.getName());
		int ott_id = redisWatingRoomService.checkUser(principal.getName());
		redisWatingRoomService.removeWatingUser(principal.getName(), ott_id);
		return "redirect:/autoMatch/myParty";
	}
}
