package com.spring.ott.controller;


import java.security.Principal;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.ott.service.ErollPartyService;
import com.spring.ott.service.MatchingCheckService;
import com.spring.ott.service.PartyService;
import com.spring.ott.service.WatingRoomService;
import com.spring.ott.vo.PartyVo;

@Controller
public class EnrollController {
	@Autowired MatchingCheckService matchingCheckService;
	@Autowired PartyService partyService;
	@Autowired WatingRoomService watingService;
	@Autowired ErollPartyService enrollPartyService;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/autoMatch/matching/enroll")
	public String enroll(Principal principal, int ott_id, Model model) {
		//이미 해당 유저의 매칭이 진행중인 경우
		HashMap<Integer,Object> matchinCheck = matchingCheckService.matchingCheck(principal.getName());
		if( !matchinCheck.containsKey(0)) {
			if(matchinCheck.containsKey(1)) {
				model.addAttribute("msg", "이미 매칭된 파티가 존재합니다! My파티 페이지로 이동합니다");
				model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
				return "home/alert";
			}
			else if(matchinCheck.containsKey(2)) {
				model.addAttribute("msg", "이미 매칭된 파티가 존재합니다! My파티 페이지로 이동합니다");
				model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
				return "home/alert";
			}
			else {
				model.addAttribute("msg", "이미 고객님의 파티매칭이 진행중입니다!");
				return "automatching/matching.tiles";
			}
		}
		else {
			//매칭이 진행중이지 않은 유저만 매칭진행
			PartyVo myParty = partyService.getMyParty(ott_id);
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
				map.put("input_num", 1);
				//enroll 멤버
				enrollPartyService.enrollParty(map);
				//핸드폰 알림기능(예정)
			}
			model.addAttribute("msg", "정상적으로 등록하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
			return "home/alert";
		}
	}
	
	@GetMapping("/autoMatch/matching/enroll/{invite_code}")
	public String invited_enroll(@PathVariable String invite_code, Model model, Principal principal) {
		PartyVo vo = partyService.checkInvite(invite_code);
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
