package com.spring.ott.controller.pse;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.NotificationsService;
import com.spring.ott.vo.NotificationsVo;


@Controller
public class NotificationController {
	@Autowired NotificationsService nservice;
	@RequestMapping(value ="/notiShow",method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> notiShow(Principal prin) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(prin==null) {
			
			map.put("list", "login");
			return map;
		}
		String user_id=prin.getName();
		System.out.println(user_id);
		List<NotificationsVo> list=nservice.selectAll(user_id);
		if(list.size()==0) {
			map.put("list", "good");
		}else {
			map.put("list", list);
			
		}
		return map;
	}
	@RequestMapping(value ="/notiDel",method = RequestMethod.GET)
	@ResponseBody
	public void notiDel(Principal prin) {
		String user_id=prin.getName();
		nservice.deluserNoti(user_id); 
	}
	@RequestMapping(value ="/noti/delnoti",method = RequestMethod.GET)
	@ResponseBody
	public void delnoti(int notify_id) {
		nservice.delNoid(notify_id);
	}
	@RequestMapping(value ="/noti/count",method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> count(Principal prin) {
		HashMap<String, Object> map =new HashMap<String, Object>();
		if(prin==null) {
			System.out.println("눌임");
			map.put("noticount", 0);
			return map;
		}else {
		String user_id=prin.getName();
		
		int n=nservice.cnt(user_id);
		map.put("noticount", n);
		return map;
		}
	}
	
}
