package com.spring.ott.controller.ktw;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value = "/admin/wp-admin", method = RequestMethod.GET)
	public String test(Model model) {
		
		return "index.tiles";
	}
}
