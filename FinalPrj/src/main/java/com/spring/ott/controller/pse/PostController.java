package com.spring.ott.controller.pse;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CategoryVo;
import com.spring.ott.vo.PostVo;

@Controller
public class PostController {
	@Autowired PostService service;
	@Autowired CommentsService cservice;
	@Autowired ServletContext sc;
	@GetMapping("/post/delete")
	public String delete(int post_id) {
		cservice.delPost(post_id);
		service.delete(post_id);
		return "redirect:/board/list";
				
	}
	@GetMapping("/post/update")
	public String update(int post_id,Model m) {
		List<CategoryVo> cateList=service.category();
		PostVo vo=service.one(post_id);
		
		m.addAttribute("list", cateList);
		m.addAttribute("title", vo.getTitle());
		m.addAttribute("post_id", post_id);
		m.addAttribute("content", vo.getContent());
		return "/board/update";
	}
	@PostMapping("/post/update")
	public String updateSave(PostVo vo) {
		service.update(vo);
		return "redirect:/board/list";
	}
}
