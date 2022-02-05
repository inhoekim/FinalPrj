package com.spring.ott.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.CreatePartyService;
import com.spring.ott.service.OttService;
import com.spring.ott.service.PartyService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.OttVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;
import com.spring.ott.vo.UserVo;

@Controller
public class CreatyPartyController {
	@Autowired PartyService partyService;
	@Autowired UserService userService;
	@Autowired OttService ottService;
	@Autowired CreatePartyService createPartyService;
	
	@GetMapping("/autoMatch/matching/createParty")
	public String creatyPartyForm(int ott_id, Principal principal, Model model ) {
		//expire 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 30);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd") ;
		//유저정보 가져오기
		UserVo userVo = userService.selectUser(principal.getName());
		//Ott정보 가져오기
		OttVo ottVo = ottService.selectOtt(ott_id);
		model.addAttribute("ottId", ottVo.getOtt_id());
		model.addAttribute("ottName", ottVo.getOtt_name());
		model.addAttribute("ottAddr", ottVo.getDomain_addr());
		model.addAttribute("userName", userVo.getName());
		model.addAttribute("expire", format.format(cal.getTime()));
		return "automatching/creatyPartyForm.tiles";
	}
	
	@PostMapping("/autoMatch/matching/createParty")
	public String creatyParty(int ott_id, PartyVo partyVo, SettleVo settleVo, Principal principal) {
		partyVo.setLeader(principal.getName());
		settleVo.setTarget_id(principal.getName());
		System.out.println(partyVo);
		System.out.println(settleVo);
		createPartyService.createParty(partyVo, settleVo);

		return "redirect:/autoMatch/matching";
	}
}
