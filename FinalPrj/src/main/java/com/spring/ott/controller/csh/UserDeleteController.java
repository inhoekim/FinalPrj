package com.spring.ott.controller.csh;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.UserVo;

@Controller
public class UserDeleteController {
	@Autowired UserService service;
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@Autowired private ServletContext servletContext;
	@Autowired PasswordEncoder pwdEncoder;
	
	@GetMapping("/deleteUser")
	public String deleteForm(Principal principal, Model model) {
		List<PostVo> rList=pservice.recentPost();
		List<PostVo> bList=pservice.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = pservice.recent_findParty();	
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		UserVo vo=service.selectUser(principal.getName());
		model.addAttribute("user_id",vo.getUser_id());
		return "home/deleteForm.tiles";
	}
	
	@PostMapping("/deleteUser")
	public String delete(String user_id, String pwd, Model model, Principal principal) {
		try {
			UserVo vo=service.selectUser(user_id);
			if(true == pwdEncoder.matches(pwd, vo.getPwd())) {
				service.deleteUser(user_id);
				SecurityContextHolder.clearContext();
				model.addAttribute("msg", "회원탈퇴가 완료되었습니다.\n 그동안 이용해주셔서 감사합니다.");
				model.addAttribute("url", servletContext.getContextPath() + "/");
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "오류로 인해 탈퇴에 실패하였습니다.");
			model.addAttribute("url", servletContext.getContextPath() + "/");
		}
		return "home/alert";
	}
}
 