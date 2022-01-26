package com.spring.ott.controller.ktw;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminListController {
	@RequestMapping(value = "/adminlist", method = RequestMethod.GET)
	public String list( Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();

	    //List<UserVo> list=service.selectList(map);    
	    //.addAttribute("list", list);
		return "list.tiles";
	}

}
