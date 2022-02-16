package com.spring.ott.controller.pse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;

@Controller
public class DetailController {
	@Autowired PostService service;
	@Autowired CommentsService cService;
	@GetMapping("/board/detail")
	public String detail(Model m) {
		//service.addHit(post_id);
		//PostVo vo= service.postDetail(post_id);
		//m.addAttribute("vo", vo);
		return "board/boardDetail.tiles";
	}
	@RequestMapping(value ="/commList",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> getComm(int post_id) {
		System.out.println(post_id+"받음");
		List<CommentsVo> list=cService.selectAll(post_id);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	@RequestMapping(value ="/userwriteList",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> getwriteList(String user_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<PostVo> plist=service.userPost(user_id);
		List<CommentsVo> clist=service.userComment(user_id);
		map.put("plist", plist);
		map.put("clist", clist);
		return map;
	}
}
