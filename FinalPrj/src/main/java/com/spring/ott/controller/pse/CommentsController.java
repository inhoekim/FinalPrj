package com.spring.ott.controller.pse;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.CommentsService;
import com.spring.ott.vo.CommentsVo;

@Controller
public class CommentsController {
	@Autowired CommentsService service;
	@RequestMapping(value ="/commInsert",method = RequestMethod.GET)
	@ResponseBody
	public void insertComm(String content,int post_id,String user_id) {
		System.out.println(content+","+post_id+","+user_id);
		int comment_id=service.getNum()+1;
		service.insertComment(new CommentsVo(comment_id, post_id, user_id, content, comment_id, 0, 0, null, null));
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
			service.update(new CommentsVo(comment_id, comment_id, null, "", comment_id, comment_id, comment_id, null, null));
		}else {
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
		CommentsVo vo =new CommentsVo(comment_id, comment_id, content, content, comment_id, comment_id, comment_id, null, null);
		service.update(vo);
	}
	@RequestMapping(value ="/commrereply",method = RequestMethod.GET)
	@ResponseBody
	public void rereply(int comment_id,String content,int post_id) {
		int ref=service.selreff(comment_id);
		int lev=service.selref(ref);
		service.insertReComment(new CommentsVo(service.getNum()+1,post_id,"test",content,ref,lev, 1, null, null));
	}
}
