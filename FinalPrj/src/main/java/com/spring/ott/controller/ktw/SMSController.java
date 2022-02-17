package com.spring.ott.controller.ktw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SMSController {
	
	@RequestMapping(value = "/sms", method = RequestMethod.GET)
	public String test( ) {
		
		return "sms.tiles";
	}
	
	
	@RequestMapping(value = "/sms1", method = RequestMethod.POST)
	public String test1( ) {
		
		return "adminview/admin/sms1";
	}
	@RequestMapping(value = "/sms1", method = RequestMethod.GET)
	public String test11( ) {
		
		return "adminview/admin/sms1";
	}
	
	//test
	@RequestMapping(value = "/sms2", method = RequestMethod.GET)
	public String test2( ) {
		
		return "adminview/admin/sms2";
	}
}
