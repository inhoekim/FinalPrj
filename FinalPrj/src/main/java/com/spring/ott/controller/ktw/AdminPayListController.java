package com.spring.ott.controller.ktw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.spring.ott.service.PayMentService;
import com.spring.ott.vo.PayMentVo;
import com.spring.ott.vo.VisiterVo;

@Controller
public class AdminPayListController {
	
	@Autowired private PayMentService service;
	
	@RequestMapping("/adminpaylist")
	public ModelAndView list(Model model) {
		ModelAndView mv = new ModelAndView("paylist.tiles");

		return mv;
	}
	@RequestMapping(value = "/adminpaylist1")
	@ResponseBody
	public List<PayMentVo> test1(Model model) {
		List<PayMentVo> list =service.AllSelect();
		
		
		model.addAttribute("list",list);
		return list;
	}
	
	
}
