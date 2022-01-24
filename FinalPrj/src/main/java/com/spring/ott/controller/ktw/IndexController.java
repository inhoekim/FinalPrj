package com.spring.ott.controller.ktw;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/wp-admin")
	public String index(Model model ,String spage) {
		
		if(spage==null)
		{
			spage="admin/index.jsp";
		}
		model.addAttribute("header", "header.jsp");
		model.addAttribute("contentmapping", "contentmapping.jsp");
		model.addAttribute("main", spage);
		model.addAttribute("contentfooter", "contentfooter.jsp");
		//model.addAttribute("footer", "footer.jsp");
		
		return "adminview/layout";
	}
}
