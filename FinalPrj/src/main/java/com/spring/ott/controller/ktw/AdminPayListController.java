package com.spring.ott.controller.ktw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spring.ott.service.PayMentService;

@Controller
public class AdminPayListController {
	
	@Autowired private PayMentService service;
	
	@RequestMapping("/adminpaylist")
	public ModelAndView list(Model model) {
		ModelAndView mv = new ModelAndView("paylist.tiles");
		mv.addObject("list", service.AllSelect());
		return mv;
	}
	
	
	
}
