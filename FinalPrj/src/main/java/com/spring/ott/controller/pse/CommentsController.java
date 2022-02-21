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

@Controller
public class CommentsController {
	@Autowired CommentsService service;
	@Autowired NotificationsService nservice;
	@Autowired PostService pservice;
	@Autowired VoteService vservice;
	@RequestMapping(value ="/commInsert",method = RequestMethod.GET)
	@ResponseBody
	public void insertComm(String content,int post_id,Principal prin) {
		String user_id=prin.getName();
		System.out.println(content+","+post_id);
		int comment_id=service.getNum()+1;
		PostVo vo=pservice.one(post_id);
		String id=vo.getUser_id();
		service.insertComment(new CommentsVo(comment_id, post_id, user_id ,content, comment_id, 0, 0, null, null,null,0,0,""));
		nservice.commNoti(new NotificationsVo(comment_id, id, post_id, 1,user_id, comment_id));
	}
	@RequestMapping(value ="/commCount",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> getCount(int post_id) {
		HashMap<String, Object>map=new HashMap<String, Object>();
		int n=service.getCount(post_id);
		map.put("count", n);
		return map;
	}
	@RequestMapping(value ="/commRemove",method = RequestMethod.GET)
	@ResponseBody
	public void remove(int comment_id) {
		CommentsVo vo=service.selectComm(comment_id);
		if(vo.getLev()>0) {
			nservice.deleteComm(comment_id);//알림지우기
			vservice.delete(comment_id);//추천지우기
			service.update(new CommentsVo(comment_id, comment_id, null, "<span style='color:grey'><strike>삭제된 댓글입니다</strike></span>", comment_id, comment_id, comment_id, null, null,null,0,0,""));
		}else {
			vservice.delete(comment_id);
			nservice.deleteComm(comment_id);
			service.delete(comment_id);
		}
	}
	@RequestMapping(value ="/selComm",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> selComm(int comment_id) {
		HashMap<String, Object>map=new HashMap<String, Object>();
		CommentsVo vo=service.selectComm(comment_id);
		map.put("content", vo.getContent());
		return map;
	}
	@RequestMapping(value ="/commupdate",method = RequestMethod.GET)
	@ResponseBody
	public void update(int comment_id,String content) {
		CommentsVo vo =new CommentsVo(comment_id, comment_id, content, content, comment_id, comment_id, comment_id, null, null,null,0,0,"");
		service.update(vo);
	}
	@RequestMapping(value ="/commrereply",method = RequestMethod.GET)
	@ResponseBody
	public void rereply(int comment_id,String content,int post_id,String parent_id,Principal prin) {
		String user_id=prin.getName();
		System.out.println(parent_id);
		int comments_id=service.getNum()+1;
		int ref=service.selreff(comment_id);
		int lev=service.selref(ref);
		service.insertReComment(new CommentsVo(comments_id,post_id,user_id,content,ref,lev, 1, null, null,parent_id,0,0,""));
		nservice.commNoti(new NotificationsVo(ref, parent_id, post_id,2,user_id,comments_id ));
		
	}
}
