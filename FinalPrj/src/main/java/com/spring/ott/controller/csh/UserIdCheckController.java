package com.spring.ott.controller.csh;



import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.spring.ott.service.UserService;
import com.spring.ott.vo.UserVo;

@Controller
public class UserIdCheckController {
	@Autowired UserService service;
	
	@RequestMapping(value="/idCheck/{user_id}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> idChk(@PathVariable("user_id")String user_id){
		UserVo vo=service.selectUser(user_id);
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(vo!=null) {
			map.put("using",true);
		}else {
			map.put("using", false);
		}
		return map;
	}
		
}
