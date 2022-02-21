package com.spring.ott.controller.ktw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SMSController {
	
	@RequestMapping(value = "/admin/adminsms", method = RequestMethod.GET)
	public String test( ) {
		
		return "sms.tiles";
		//return "adminview/admin/sms";
	}
	
	
	@RequestMapping(value = "/admin/sms1", method = RequestMethod.POST)
	public String test1( ) {
		
		return "adminview/admin/sms1";
	}
	@RequestMapping(value = "/admin/sms1", method = RequestMethod.GET)
	public String test11( ) {
		
		return "adminview/admin/sms1";
	}
	
	//test
	@RequestMapping(value = "/admin/sms2", method = RequestMethod.GET)
	public String test2( ) {
		
		return "adminview/admin/sms2";
	}
}
