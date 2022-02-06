package com.spring.ott.controller;

import java.security.Principal;

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
		int page = matchingCheckService.matchingCheck(principal.getName());
		if(page == 1) {
			return "automatching/myPartyLeader.tiles";
		}else if (page == 2) {
			return "automatching/myParty.tiles";
		}else if (page == 3) {
			return "automatching/wating.tiles";
		}
		UserVo userVo = userService.selectUser(principal.getName());
		model.addAttribute("userName", userVo.getName());
		return "automatching/startMatching.tiles";
	}
}
