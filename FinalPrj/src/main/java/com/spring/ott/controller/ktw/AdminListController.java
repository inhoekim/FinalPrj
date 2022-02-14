package com.spring.ott.controller.ktw;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.UserService;
import com.spring.ott.vo.PayMentVo;
import com.spring.ott.vo.UserVo;

@Controller
public class AdminListController {
	@Autowired UserService service;
	
	@RequestMapping("/adminlist")
	public ModelAndView list( Model model) {
		ModelAndView mv = new ModelAndView("list.tiles");
		return mv;
	}

	@RequestMapping(value = "/adminlist1")
	@ResponseBody
	public List<UserVo> test(Model model) {
		List<UserVo> list = service.AllSelect();
		System.out.println(list.get(0));
		model.addAttribute("list",list);
		return list;
	}
}
 