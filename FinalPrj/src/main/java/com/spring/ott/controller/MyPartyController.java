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
import com.spring.ott.service.SettleService;
import com.spring.ott.service.UserService;
import com.spring.ott.util.CalendarUtil;
import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.MemberVo;
import com.spring.ott.vo.OttVo;
import com.spring.ott.vo.PartyVo;
import com.spring.ott.vo.SettleVo;
import com.spring.ott.vo.UserVo;

@Controller
public class MyPartyController {
	@Autowired MatchingCheckService matchingCheckService;
	@Autowired UserService userService;
	@Autowired MatchingService matchingService;
	@Autowired OttService ottService;
	@Autowired PartyService partyService;
	@Autowired SettleService settleService;
	
	@GetMapping("/autoMatch/myParty")
	public String myParty(Principal principal, Model model) {
		HashMap<Integer,Object> map = matchingCheckService.matchingCheck(principal.getName());
		UserVo userVo = userService.selectUser(principal.getName());
		model.addAttribute("userName", userVo.getName());
		
		if(map.containsKey(1)) {
			PartyVo partyVo = (PartyVo) map.get(1);
			MemberVo leader = userService.selectMember(partyVo.getLeader());
			OttVo ottVo = ottService.selectOtt(partyVo.getOtt_id());
			SettleVo settleVo = settleService.select(leader.getUser_id());
			List<MemberVo> list = matchingService.selectMember(partyVo.getParty_id());		
			int remain_day = CalendarUtil.getDiffDay(partyVo.getExpiration_date());
			int price = (int)(ottVo.getMonth_price() / 4 + 490);
			model.addAttribute("member_list", list);
			model.addAttribute("partyVo", partyVo);
			model.addAttribute("ottVo", ottVo);
			model.addAttribute("leader", leader);
			model.addAttribute("remain_day", remain_day);;
			model.addAttribute("price", price);
			String[] logos = {"icon_netflix_x2.png","icon_watcha_x2.png","icon_disney_x2.png"};
			String[] banks = {"하나", "국민", "신한", "농협", "우체국", "기업"};
			String[] bank_src = {"KEBhana_52.png", "KBkookmin_52.png", "shinhan_52.png", "NHnonghyup-52.png", "koreaPost-52.png", "ibk_52.png"};
			model.addAttribute("logo_src", logos[ottVo.getOtt_id()]);
			model.addAttribute("bank_name", banks[settleVo.getBank_id()]);
			model.addAttribute("bank_src", bank_src[settleVo.getBank_id()]);
			model.addAttribute("bank_account", settleVo.getBank_account());
			return "automatching/myParty_leader.tiles";
		}else if (map.containsKey(2)) {
			int my_party = ((MatchingVo) map.get(2)).getParty_id();
			PartyVo partyVo = partyService.selectParty(my_party);
			MemberVo leader = userService.selectMember(partyVo.getLeader());
			OttVo ottVo = ottService.selectOtt(partyVo.getOtt_id());
			List<MemberVo> list = matchingService.selectMember(my_party);		
			int remain_day = CalendarUtil.getDiffDay(partyVo.getExpiration_date());
			int fees = CalendarUtil.getFees(remain_day);
			int price = (int)(ottVo.getMonth_price() / 30 * remain_day / 4 + fees);
			model.addAttribute("member_list", list);
			model.addAttribute("leader", leader);
			model.addAttribute("partyVo", partyVo);
			model.addAttribute("ottVo", ottVo);
			model.addAttribute("me", principal.getName());
			model.addAttribute("remain_day", remain_day);
			model.addAttribute("fees", fees);
			model.addAttribute("price", price);
			String[] logos = {"icon_netflix_x2.png","icon_watcha_x2.png","icon_disney_x2.png"};
			model.addAttribute("logo_src", logos[ottVo.getOtt_id()]);
			return "automatching/myParty_member.tiles";
		}else if (map.containsKey(3)) {
			model.addAttribute("watingRoomVo", map.get(3));
			return "automatching/wating.tiles";
		}
		
		return "automatching/startMatching.tiles";
	}
}
