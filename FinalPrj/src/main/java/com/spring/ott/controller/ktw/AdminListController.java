package com.spring.ott.controller.ktw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminListController {
	
	@RequestMapping(value = "/adminlist", method = RequestMethod.GET)
	public String test( ) {
		
		return "list.tiles";
	}
}
