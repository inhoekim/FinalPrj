package com.spring.ott.controller.ktw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.PayMentService;
import com.spring.ott.vo.PayMentVo;

@Controller
public class KakaoCancelController {
	@Autowired PayMentService service;
	
	@RequestMapping("/kakaoc")
	public ModelAndView list(Model model) {
		ModelAndView mv = new ModelAndView("kakaocancel.tiles");

		return mv;
	}
	
	
	@RequestMapping(value="/kakaopaycancel",method=RequestMethod.POST)
	public String join() {
		
		System.out.println("카카페이 환불 컨트롤러까지옴");
		try {
			
			System.out.println("카카오페이컨트롤러 db저장성공");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오페이컨트롤러 db저장실패");
		}
		
		
		return "redirect:/wp-admin";
	}
}
