package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.ErollPartyService;
import com.spring.ott.service.PartyService;
import com.spring.ott.vo.PartyVo;

@Controller
public class ResignController {
	@Autowired PartyService partyService;
	@Autowired ErollPartyService erollPartyService;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/autoMatch/resign/member")
	public String resign(Model model,int party_id,Principal principal) {
		PartyVo partyVo = partyService.selectParty(party_id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("party_id", party_id);
		map.put("input_num", -1);
		map.put("user_id", principal.getName());
		if(partyVo.getParty_state() == 0) {
			erollPartyService.resignParty(map);
			model.addAttribute("msg", "파티를 탈퇴하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
		}else {
			model.addAttribute("msg", "매칭이 완료된 파티는 탈퇴가 불가능합니다.");
			model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
		}

		return "home/alert";
	}
	
	@GetMapping("/autoMatch/resign/leader")
	public String resignLeader(Model model,int party_id,Principal principal) {
		PartyVo partyVo = partyService.selectParty(party_id);
		HashMap<String, Object> map = new HashMap<>();
		map.put("party_id", party_id);
		map.put("party_state", 3);
		if(partyVo.getParty_state() == 0) {
			erollPartyService.resignPartyLeader(party_id, map);
			model.addAttribute("msg", "파티를 탈퇴하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
		}else {
			model.addAttribute("msg", "매칭이 완료된 파티는 탈퇴가 불가능합니다.");
			model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
		}

		return "home/alert";
	}
	
}
