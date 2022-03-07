package com.spring.ott.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ott.service.CreatePartyService;
import com.spring.ott.service.MatchingCheckService;
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
	@Autowired MatchingCheckService matchingCheckService;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/autoMatch/matching/createParty")
	public String creatyPartyForm(int ott_id, Principal principal, Model model) {
		
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
			}else {
				model.addAttribute("msg", "이미 고객님의 파티매칭이 진행중입니다! My파티 페이지로 이동합니다");
				model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");
				return "home/alert";
			}
		}
		else {
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
	}
	
	@PostMapping("/autoMatch/matching/createParty")
	public String creatyParty(int ott_id, PartyVo partyVo, SettleVo settleVo, Principal principal, Model model) {
		partyVo.setLeader(principal.getName());
		settleVo.setTarget_id(principal.getName());
		createPartyService.createParty(partyVo, settleVo);
		
		model.addAttribute("msg", "파티생성이 완료되었습니다!");
		model.addAttribute("url", servletContext.getContextPath() + "/autoMatch/myParty");

		return "home/alert";
	}
}
