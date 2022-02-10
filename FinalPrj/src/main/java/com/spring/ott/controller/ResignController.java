package com.spring.ott.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.ErollPartyService;

@Controller
public class ResignController {
	@Autowired ErollPartyService erollPartyService;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/autoMatch/resign/member")
	public String resign(Model model,int party_id,Principal principal) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("party_id", party_id);
		map.put("input_num", -1);
		map.put("user_id", principal.getName());
		erollPartyService.resignParty(map);
		model.addAttribute("msg", "파티를 탈퇴하였습니다!");
		model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
		return "home/alert";
	}
	
}
