package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.MatchingCheckService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.UserVo;

@Controller
public class MyPartyController {
	@Autowired MatchingCheckService matchingCheckService;
	@Autowired UserService userService;
	
	@GetMapping("/autoMatch/myParty")
	public String myParty(Principal principal, Model model) {
		HashMap<Integer,Object> map = matchingCheckService.matchingCheck(principal.getName());
		UserVo userVo = userService.selectUser(principal.getName());
		model.addAttribute("userName", userVo.getName());
		if(map.containsKey(1)) {
			return "automatching/myPartyLeader.tiles";
		}else if (map.containsKey(2)) {
			return "automatching/myParty.tiles";
		}else if (map.containsKey(3)) {
			model.addAttribute("watingRoomVo", map.get(3));
			return "automatching/wating.tiles";
		}
		return "automatching/startMatching.tiles";
	}
}
