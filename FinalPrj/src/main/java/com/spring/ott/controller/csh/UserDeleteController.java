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
public class UserDeleteController {
	@Autowired UserService service;
	
	@GetMapping("/deleteUser")
	public String deleteForm(Principal principal, Model model) {
		UserVo vo=service.selectUser(principal.getName());
		model.addAttribute("user_id",vo.getUser_id());
		return "csh/deleteForm";
	}
	
	@PostMapping("/deleteUser")
	public String delete(String user_id, Model model) {
		try {
			service.deleteUser(user_id);
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "csh/result";
	}
}
 