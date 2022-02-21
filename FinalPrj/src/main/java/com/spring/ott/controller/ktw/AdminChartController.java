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

	
	//결제 차트 에이작스 전용
	// 3번페이지 ajax전용 차트js 1  
	@RequestMapping(value = "/adminpaymentchart1", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody String test11() {
		
		//현재 날짜 구해서 데이터형태를 포맷후 넘겨주기
		LocalDate now = LocalDate.now();
		
		//포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		
		// formatedNow 변수에 포맷적용
		String formatedNow = now.format(formatter);
		
		List<VisiterVo> list1 = service.Pay7final(formatedNow);
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<VisiterVo> it = list1.iterator();
		while(it.hasNext()) {
			VisiterVo vo = it.next();
			JsonObject object = new JsonObject();
			int pay1 = vo.getPay1();
			int pay2 = vo.getPay2();
			int pay3 = vo.getPay3();
			int pay4 = vo.getPay4();
			int pay5 = vo.getPay5();
			int pay6 = vo.getPay6();
			int pay7 = vo.getPay7();
			
			int pay11 = vo.getPay11();
			int pay12 = vo.getPay12();
			int pay13 = vo.getPay13();
			int pay14 = vo.getPay14();
			int pay15 = vo.getPay15();
			int pay16 = vo.getPay16();
			int pay17 = vo.getPay17();
			
			int pay21 = vo.getPay21();
			int pay22 = vo.getPay22();
			int pay23 = vo.getPay23();
			int pay24 = vo.getPay24();
			int pay25 = vo.getPay25();
			int pay26 = vo.getPay26();
			int pay27 = vo.getPay27();
			object.addProperty("Pay1", pay1);
			object.addProperty("Pay2", pay2);
			object.addProperty("Pay3", pay3);
			object.addProperty("Pay4", pay4);
			object.addProperty("Pay5", pay5);
			object.addProperty("Pay6", pay6);
			object.addProperty("Pay7", pay7);
			
			object.addProperty("Pay11", pay11);
			object.addProperty("Pay12", pay12);
			object.addProperty("Pay13", pay13);
			object.addProperty("Pay14", pay14);
			object.addProperty("Pay15", pay15);
			object.addProperty("Pay16", pay16);
			object.addProperty("Pay17", pay17);
			
			object.addProperty("Pay21", pay21);
			object.addProperty("Pay22", pay22);
			object.addProperty("Pay23", pay23);
			object.addProperty("Pay24", pay24);
			object.addProperty("Pay25", pay25);
			object.addProperty("Pay26", pay26);
			object.addProperty("Pay27", pay27);

			jArray.add(object);
		}
		

		String json = gson.toJson(jArray);
		System.out.println(json.toString());
		
		return json;
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
