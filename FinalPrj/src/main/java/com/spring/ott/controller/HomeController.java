package com.spring.ott.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;

@Controller
public class HomeController {
	@Autowired PostService service;
	@Autowired CommentsService cservice;
	@GetMapping(value = "/")
	public String home(Model m) {
		List<PostVo> rList=service.recentPost();
		List<PostVo> bList=service.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = service.recent_findParty();
		m.addAttribute("bList", bList);
		m.addAttribute("rList", rList);
		m.addAttribute("cBList", cBList);
		m.addAttribute("cRList", cRList);
		m.addAttribute("rPList", rPList);
		
		return "home/home.tiles";
	}
	
}