package com.spring.ott.controller.csh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.UserService;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.UserVo;



@Controller
public class UserJoinController {
	@Autowired UserService service;
	
	@GetMapping("/join")
	public String joinForm() {
		return "csh/userJoin";
	}
	@PostMapping("/join")
	public String join(UserVo uVo, AuthoritiesVo aVo, Model model) {
		try {
			service.insert(uVo);
			service.insertAuth(aVo);
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "csh/result";
	}
}