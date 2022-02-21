package com.spring.ott.controller.pse;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.AccusationService;
import com.spring.ott.service.CommentsService;
import com.spring.ott.service.NotificationsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.ProfileImgService;
import com.spring.ott.service.VoteService;
import com.spring.ott.vo.AccusationVo;
import com.spring.ott.vo.CategoryVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.UserProfileVo;

@Controller
public class PostController {
	@Autowired PostService service;
	@Autowired CommentsService cservice;
	@Autowired AccusationService aservice;
	@Autowired VoteService vservice;
	@Autowired NotificationsService nservice;
	@Autowired ProfileImgService profileService;
	@Autowired ServletContext sc;
	
	@GetMapping("/post/delete")
	public String delete(int post_id) {
		nservice.delPostNoti(post_id);
		vservice.delPostVote(post_id);
		cservice.delPost(post_id);
		service.delete(post_id);
		return "redirect:/";
				
	}
	@PostMapping("/post/update")
	public String updateSave(PostVo postVo, Model model) {
		service.update(postVo);
		model.addAttribute("msg", "글수정이 완료되었습니다!");
		model.addAttribute("url", sc.getContextPath() + "/board/detail?post_id=" + postVo.getPost_id() + "&category=" + postVo.getCategory_id());
		return "home/alert";
	}
	@GetMapping("/post/accusation")
	public String accusationForm(int post_id,Model m) {
		PostVo vo=service.one(post_id);
		m.addAttribute("vo", vo);
		return "/board/accusation";
		
	}
	@PostMapping("/post/accusation")
	public String accsation(AccusationVo vo,Principal prin) {
		String user_id=prin.getName();
		vo.setUser_id(user_id);
		aservice.postAccusation(vo);
		return "redirect:/board/list";
	}
}
