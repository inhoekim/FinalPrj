package com.spring.ott.controller.ktw;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.ott.service.UserService;
import com.spring.ott.service.VisiterService;
import com.spring.ott.vo.VisiterVo;

@Controller
public class AdminChartController {

	@Autowired private VisiterService service;
	@Autowired private UserService userservice;
	
	
	//1번째 페이지 시작  결제 차트
	@RequestMapping(value = "/adminpaymentchart", method = RequestMethod.GET)
	public String test1( ) {
		
		return "1paymentchart.tiles";
	}
	
	//2번째 페이지 시작 파티 차트
	@RequestMapping(value = "/adminpartchart", method = RequestMethod.GET)
	public String test2( ) {
		
		return "2partchart.tiles";
	}
	
	
	
	//3번째 페이지 시작 회원 차트
	
	@RequestMapping(value = "/adminmemberchart", method = RequestMethod.GET)
	public ModelAndView test3(Model model) {
		ModelAndView mv= new ModelAndView("3memberchart.tiles");
		
		return mv;
	}
	
	// 3번페이지 ajax전용 차트js 1  
	@RequestMapping(value = "/adminmemberchart1", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String test31() {
		
		
		List<VisiterVo> list1 = service.memberstatus();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<VisiterVo> it = list1.iterator();
		while(it.hasNext()) {
			VisiterVo vo = it.next();
			JsonObject object = new JsonObject();
			int cnt = vo.getCount();
			int cnt1 = vo.getCount1();

			object.addProperty("Count", cnt);
			object.addProperty("Count1", cnt1);

			jArray.add(object);
		}
				
		String json = gson.toJson(jArray);
		
		
		return json;
	}
	// 3번페이지 ajax전용 차트js 2 
	@RequestMapping(value = "/adminmemberchart2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String test32() {
		
		
		List<VisiterVo> list1 = service.memberage();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<VisiterVo> it = list1.iterator();
		while(it.hasNext()) {
			VisiterVo vo = it.next();
			JsonObject object = new JsonObject();
			int age1 = vo.getAge10();
			int age2 = vo.getAge20();
			int age3 = vo.getAge30();
			int age4 = vo.getAge40();

			
			object.addProperty("Age10", age1);
			object.addProperty("Age20", age2);
			object.addProperty("Age30", age3);
			object.addProperty("Age40", age4);


			jArray.add(object);
		}
		
		String json = gson.toJson(jArray);
		
		
		return json;
	}
	
	// 3번페이지 ajax전용 차트js 3
	@RequestMapping(value = "/adminmemberchart3", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String test33() {
		
		//현재 날짜 구해서 데이터형태를 포맷후 넘겨주기
		LocalDate now = LocalDate.now();
		
		//포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		
		// formatedNow 변수에 포맷적용
		String formatedNow = now.format(formatter);
		
		List<VisiterVo> list1 = service.DayCount(formatedNow);
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<VisiterVo> it = list1.iterator();
		while(it.hasNext()) {
			VisiterVo vo = it.next();
			JsonObject object = new JsonObject();
			String day1  = vo.getDay1();
			String day2  = vo.getDay2();
			String day3  = vo.getDay3();
			String day4  = vo.getDay4();
			String day5  = vo.getDay5();
			String day6  = vo.getDay6();
			String day7  = vo.getDay7();

			object.addProperty("DAY1", day1);
			object.addProperty("DAY2", day2);
			object.addProperty("DAY3", day3);
			object.addProperty("DAY4", day4);
			object.addProperty("DAY5", day5);
			object.addProperty("DAY6", day6);
			object.addProperty("DAY7", day7);

			
			
			jArray.add(object);
		}
		
		String json = gson.toJson(jArray);
		
		
		return json;
	}
	
	
	
	
	
	
	
	//4번째 페이지 시작
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
		
		
		//test
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
		
		
		
		mv.addObject("today",formatedNow);
		//mv.addObject("list",service.alldayselect());
		mv.addObject("todaycnt",service.onedaylog(formatedNow));
		mv.addObject("yesterday",service.onedaylog(yesterday));

		return mv;
	}
	
	// 4번페이지 ajax전용 차트js
	@RequestMapping(value = "/adminvisiterchart2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String test42(String day) {
		
		System.out.println(day);
		
		List<VisiterVo> logNameList = service.onedayselect(day);
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<VisiterVo> it = logNameList.iterator();
		while(it.hasNext()) {
			VisiterVo vo = it.next();
			JsonObject object = new JsonObject();
			String ip = vo.getIp_address();
			int cnt = vo.getCount();
			
			object.addProperty("IP", ip);
			object.addProperty("Count", cnt);
			jArray.add(object);
		}
				
		String json = gson.toJson(jArray);
		
		
		return json;
	}
	
	
	// 4번페이지 ajax전용 데이터테이블
	@RequestMapping(value = "/adminvisiterchart3")
	@ResponseBody
	public List<VisiterVo> test43(Model model) {
		List<VisiterVo> list =service.alldayselect();
		model.addAttribute("list",list);

		return list;
	}
	
	
	
	
	
	
}
