package com.spring.ott.controller.csh;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.UserService;
import com.spring.ott.vo.UserVo;

@Controller
public class UserUpdateController {
	@Autowired UserService service;
	
	@GetMapping("/updateUser")
	public String updateForm(Principal principal,Model model) {
		UserVo vo=service.selectUser(principal.getName());
		model.addAttribute("vo",vo);
		return "csh/userUpdate";
	}
	
	@PostMapping("/updateUser")
	public String update(UserVo vo, Model model) {
		try {
			service.updateUser(vo);
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "csh/result";
	}
}
 