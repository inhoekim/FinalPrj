package com.spring.ott.controller.pse;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.NotificationsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.VoteService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.NotificationsVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.VoteVo;

@Controller
public class VoteController {
	@Autowired VoteService service;
	@Autowired NotificationsService nservice;
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@RequestMapping(value ="/insertPostLike",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> check(int post_id,Principal prin){
		String user_id=prin.getName();
		System.out.println(post_id+",,,"+ user_id);
		PostVo pVo=pservice.one(post_id);
		String uuser_id=pVo.getUser_id();
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("post_id", post_id);
		VoteVo vo=service.checkLike(map);
		System.out.println(vo);
		HashMap<String, Object> map2 =new HashMap<String, Object>();
		HashMap<String, Object> map3=new HashMap<String, Object>();
		map3.put("sender_id", user_id);
		map3.put("post_id", post_id);
		if(vo==null) {
			map2.put("result", "good");
			service.insertPostLike(new VoteVo(post_id, post_id,post_id, user_id, null));
			nservice.postNoti(new NotificationsVo(post_id, uuser_id, post_id, 3, user_id, post_id));
		}else {
			map2.put("result", "bad");
			service.deleteLike(map);
			nservice.delete(map3);
		}
		return map2;
		
	}
	@RequestMapping(value ="/insertCommLike",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public void checkComm(int comment_id,Principal prin){
		String user_id=prin.getName();
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("comment_id", comment_id);
		map.put("user_id", user_id);
		CommentsVo cVo=cservice.selectComm(comment_id);
		String uu_id=cVo.getUser_id();
		VoteVo vo=service.checkComm(map);
		
		if(vo==null) {
			service.insertCommLike(new VoteVo(comment_id, comment_id, comment_id, user_id, null));
			nservice.commNoti(new NotificationsVo(comment_id, uu_id,comment_id, 3,user_id, comment_id));
		}else {
			HashMap<String, Object> map2=new HashMap<String, Object>();
			service.deleteCommLike(map);
			map2.put("sender_id", user_id);
			map2.put("comment_id", comment_id);
			nservice.deleteCommNoti(map2);
		}
	
	}
	@RequestMapping(value ="/likeCount",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public int count(int post_id){
		System.out.println(post_id);
		int count=service.likeCount(post_id);
		return count;
		
		
	}
}
