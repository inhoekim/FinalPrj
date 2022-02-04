package com.spring.ott.controller.ktw;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.UserService;

@Controller
public class AdminListController {
	@Autowired UserService service;
	
	@RequestMapping("/adminlist")
	public ModelAndView list( Model model) {
		ModelAndView mv = new ModelAndView("list.tiles");
		mv.addObject("list", service.AllSelect());
		return mv;
	}

}
 