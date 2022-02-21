package com.spring.ott.controller.ktw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.spring.ott.service.PayMentService;
import com.spring.ott.vo.PayMentVo;


@Controller
public class KaKaoPayController {
	
	@Autowired PayMentService service;
	
	@RequestMapping(value="/autoMatch/kakaopayform",method=RequestMethod.POST)
	public String join(PayMentVo vo, int party_id, Model model) {
		System.out.println("vo:" + vo);
		try {
			service.PayInsert(vo, party_id);
			System.out.println("카카오페이컨트롤러 db저장성공");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오페이컨트롤러 db저장실패");
		}
		
		
		return "redirect:/autoMatch/myParty";
	}
	
	
			


}
