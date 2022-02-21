package com.spring.ott.controller.csh;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.UserService;

@Controller
public class UserFindIdController {
	@Autowired UserService service;
	
	@GetMapping("/findId")
	public String findIdForm() {
		return "home/findID.tiles";
	}
	
	@PostMapping("/findId")
	public String findId(String name, String email, Model model) {
		String user_id=service.findId(name, email);
		
		try {
			if(user_id==null) {
				model.addAttribute("user_id","조회된 정보가 없습니다");
			}else {
				model.addAttribute("user_id","회원님의 아이디 : " +user_id);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "csh/findIdForm"; 
	}
	
}