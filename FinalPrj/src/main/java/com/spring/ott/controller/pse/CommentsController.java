package com.spring.ott.controller.pse;

import org.springframework.beans.factory.annotation.Autowired;
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
	@RequestMapping(value ="/commCount",method = RequestMethod.GET)
	@ResponseBody
	public int getCount(int post_id) {
		return service.getCount(post_id);
	}
}
