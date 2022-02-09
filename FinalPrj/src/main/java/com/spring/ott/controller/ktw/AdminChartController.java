package com.spring.ott.controller.ktw;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.ott.service.VisiterService;
import com.spring.ott.vo.VisiterVo;

@Controller
public class AdminChartController {

	@Autowired private VisiterService service;
	
	@RequestMapping(value = "/adminpaymentchart", method = RequestMethod.GET)
	public String test1( ) {
		
		return "1paymentchart.tiles";
	}
	
	@RequestMapping(value = "/adminpartchart", method = RequestMethod.GET)
	public String test2( ) {
		
		return "2partchart.tiles";
	}
	
	@RequestMapping(value = "/adminmemberchart", method = RequestMethod.GET)
	public String test3( ) {
		
		return "3memberchart.tiles";
	}
	
	
	
	@RequestMapping(value = "/adminvisiterchart", method = RequestMethod.GET)
	public ModelAndView test4(Model model) {
		ModelAndView mv= new ModelAndView("4visiterchart.tiles");
		
		//현재 날짜 구해서 데이터형태를 포맷후 넘겨주기
		LocalDate now = LocalDate.now();
		//포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		// formatedNow 변수에 포맷적용

		String formatedNow = now.format(formatter);

		
		String yesterday = now.minusDays(1).format(formatter);
		
		
		mv.addObject("list",service.onedayselect(formatedNow));
		mv.addObject("todaycnt",service.onedaylog(formatedNow));
		mv.addObject("yesterday",service.onedaylog(yesterday));
		
		System.out.println(service.onedaylog(formatedNow));
		System.out.println(service.onedaylog(yesterday));
		
		List<VisiterVo> list=service.rankingselect(formatedNow);
		String iplist="[";
		String[] cntlist=new String[list.size()];
		int n=0;
		for(VisiterVo vo:list) {
			if(n!=list.size()-1) {
				iplist += "\""+vo.getIp_address()+"\",";
			}else {
				iplist += "\""+vo.getIp_address()+"\"";
			}
			cntlist[n++]=vo.getCount()+"";
		}
		iplist +="]";

		mv.addObject("iplist",iplist);
		mv.addObject("cntlist",Arrays.deepToString(cntlist));
		
		System.out.println("iplist : "+iplist);
		System.out.println("cntlist : "+Arrays.deepToString(cntlist));
		return mv;
	}
}
