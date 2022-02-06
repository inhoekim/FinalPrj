package com.spring.ott.controller.csh;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
	public String join(@Valid UserVo uVo, AuthoritiesVo aVo, Model model,HttpServletRequest request) {
		String jnum1=request.getParameter("jnum1");
		String jnum2=request.getParameter("jnum2");
		uVo.setJnum(jnum1+"-"+jnum2);
		
		/* 김인회 수정 Start */
		Random random = new Random();
		int rvalue = random.nextInt(4) + 1;
		if(jnum2.charAt(0) == '2') { rvalue += 4;} //여성인 경우
		uVo.setProfile_id(rvalue);
		/* 김인회 수정 End */
		
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