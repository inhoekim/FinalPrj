package com.spring.ott.controller.pse;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.VoteService;

import com.spring.ott.vo.VoteVo;

@Controller
public class VoteController {
	@Autowired VoteService service;
	@RequestMapping(value ="/insertLike",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> check(int post_id,String user_id){
		System.out.println(post_id+",,,"+ user_id);
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("post_id", post_id);
		VoteVo vo=service.checkLike(map);
		System.out.println(vo);
		HashMap<String, Object> map2 =new HashMap<String, Object>();
		if(vo==null) {
			map2.put("result", "good");
			service.insertLike(new VoteVo(post_id, post_id, user_id, 1, null));
		}else {
			map2.put("result", "bad");
			service.deleteLike(map);
		}
		return map2;
		
	}
	@RequestMapping(value ="/likeCount",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public int count(int post_id){
		System.out.println(post_id);
		int count=service.likeCount(post_id);
		return count;
		
		
	}
}
