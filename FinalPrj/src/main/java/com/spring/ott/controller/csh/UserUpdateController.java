package com.spring.ott.controller.csh;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
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
public class UserUpdateController {
	@Autowired UserService service;
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/updateUser")
	public String updateForm(Principal principal,Model model) {
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
		model.addAttribute("vo",vo);
		return "home/userUpdate.tiles";
	}
	
	@PostMapping("/updateUser")
	public String update(UserVo vo, Model model) {
		try {
			service.updateUser(vo);
			model.addAttribute("msg", "회원가입에 성공하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "오류로 인해 회원가입이 실패하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/");
		}
		return "home/alert";
	}
}
 