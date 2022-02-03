package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.MatchingService;
import com.spring.ott.service.PartyService;
import com.spring.ott.service.WatingRoomService;
import com.spring.ott.vo.PartyVo;

@Controller
public class EnrollController {
	@Autowired PartyService partyService;
	@Autowired WatingRoomService watingService;
	@Autowired MatchingService matchinService;
	
	@PostMapping("/autoMatch/matching/enroll")
	public String enroll(Principal principal, int ott_id, Model model) {
		PartyVo myParty = partyService.getMyParty(ott_id);
		//이미 해당 유저의 매칭이 진행중인 경우
		if(watingService.isPresence(principal.getName()) != null) {
			model.addAttribute("msg", "이미 고객님의 파티매칭이 진행중입니다!");
			return "automatching/matching.tiles";
		}
		//Wating 테이블에 등록
		if(myParty == null) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("user_id", principal.getName());
			map.put("ott_id", ott_id);
			watingService.enroll(map);
		//해당 Party에 바로추가
		}else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("party_id", myParty.getParty_id());
			map.put("user_id", principal.getName());
			matchinService.insert(map);
			//핸드폰 알림기능(예정)
		}

		return "redirect:/autoMatch/matching";
	}
	
	@GetMapping("/autoMatch/matching/enroll/{invite_code}")
	public String invited_enroll(@PathVariable String invite_code, Model model, Principal principal) {
		PartyVo vo = partyService.checkParty(invite_code);
		if(vo == null) {
			model.addAttribute("msg", "유효하지 않은 초대 코드입니다!");
			return "home/home.tiles";
		}
		if(vo.getMember_num() >= 3) {
			model.addAttribute("msg", "정원이 초과된 파티입니다!");
			return "home/home.tiles";
		}
		
		return "redirect:/autoMatch/party";
	}
}
