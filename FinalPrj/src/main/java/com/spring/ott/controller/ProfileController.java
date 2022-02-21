package com.spring.ott.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;

@Controller
public class ProfileController {
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@GetMapping("/profile/{user_id}")
	public String profile(@PathVariable("user_id") String user_id,Model m) {
		List<PostVo> pList=pservice.userPost(user_id);
		List<CommentsVo> cList=cservice.selUserComm(user_id);
		m.addAttribute("cList", cList);
		m.addAttribute("pList", pList);
		m.addAttribute("user_id", user_id);
		return "board/profile.tiles";
	}
}
