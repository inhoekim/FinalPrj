package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.MatchingCheckService;
import com.spring.ott.service.MatchingService;
import com.spring.ott.service.OttService;
import com.spring.ott.service.PartyService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.MemberVo;
import com.spring.ott.vo.OttVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.UserVo;

@Controller
public class MyPartyController {
	@Autowired MatchingCheckService matchingCheckService;
	@Autowired UserService userService;
	@Autowired MatchingService matchingService;
	@Autowired OttService ottService;
	@Autowired PartyService partyService;
	
	@GetMapping("/autoMatch/myParty")
	public String myParty(Principal principal, Model model) {
		HashMap<Integer,Object> map = matchingCheckService.matchingCheck(principal.getName());
		UserVo userVo = userService.selectUser(principal.getName());
		model.addAttribute("userName", userVo.getName());
		
		if(map.containsKey(1)) {
			return "automatching/myParty_leader.tiles";
		}else if (map.containsKey(2)) {
			int my_party = ((MatchingVo) map.get(2)).getParty_id();
			PartyVo partyVo = partyService.selectParty(my_party);
			MemberVo leader = userService.selectMember(partyVo.getLeader());
			OttVo ottVo = ottService.selectOtt(partyVo.getOtt_id());
			List<MemberVo> list = matchingService.selectMember(my_party);
			model.addAttribute("member_list", list);
			model.addAttribute("leader", leader);
			model.addAttribute("partyVo", partyVo);
			model.addAttribute("ottVo", ottVo);
			model.addAttribute("me", principal.getName());
			return "automatching/myParty_member.tiles";
		}else if (map.containsKey(3)) {
			model.addAttribute("watingRoomVo", map.get(3));
			return "automatching/wating.tiles";
		}
		
		return "automatching/startMatching.tiles";
	}
}
