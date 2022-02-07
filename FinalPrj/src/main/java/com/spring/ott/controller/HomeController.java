package com.spring.ott.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.PostService;
import com.spring.ott.vo.PostVo;

@Controller
public class HomeController {
	@Autowired PostService service;
	@GetMapping(value = "/")
	public String home(Model m) {
		List<PostVo> rList=service.recentPost();
		List<PostVo> bList=service.bestPost();
		m.addAttribute("bList", bList);
		m.addAttribute("rList", rList);
		return "home/home.tiles";
	}
	
}
