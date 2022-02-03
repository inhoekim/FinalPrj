package com.spring.ott.controller.csh;

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
	public String updateForm(String user_id,Model model) {
		UserVo vo=service.selectUser(user_id);
		model.addAttribute("vo",vo);
		return "csh/userUpdate";
	}
	
	@PostMapping("/updateUser")
	public String update(UserVo vo, Model model) {
		try {
			service.updateUser(vo);
			model.addAttribute("result","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("result","fail");
		}
		return "csh/result";
	}
}
