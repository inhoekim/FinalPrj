package com.spring.ott.controller.ktw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.BlackListService;
import com.spring.ott.vo.BlackListVo;

@Controller
public class AdminBlackListController {
	@Autowired BlackListService service;

	@RequestMapping("/admin/adminblacklist")
	public ModelAndView list( Model model) {
		ModelAndView mv = new ModelAndView("blacklist.tiles");
		return mv;
	}

	@RequestMapping(value = "/admin/adminblacklist1")
	@ResponseBody
	public List<BlackListVo> test(Model model) {
		List<BlackListVo> list = service.blackList();
		model.addAttribute("list",list);
		return list;
	}
}