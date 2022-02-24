package com.spring.ott.controller.ktw;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import com.spring.ott.service.VisiterService;
import com.spring.ott.vo.UserVo;
import com.spring.ott.vo.VisiterVo;

@Controller
public class IndexController {
	
	@Autowired VisiterService service;
	
	@RequestMapping(value = "/admin/wp-admin", method = RequestMethod.GET)
	public ModelAndView test(Model model) {
		ModelAndView mv = new ModelAndView("index.tiles");
		
		//현재 날짜 구해서 데이터형태를 포맷후 넘겨주기
		LocalDate now = LocalDate.now();
		
		//포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		
		// formatedNow 변수에 포맷적용
		String formatedNow = now.format(formatter);
		
		VisiterVo vo = service.CNT1();
		int cnt0 = vo.getCnt0();
		int cnt1 = vo.getCnt1();
		int cnt2 = vo.getCnt2();
		
		VisiterVo vo1 = service.NewMemberCount(formatedNow);
		System.out.println(vo1.toString());
		
		mv.addObject("cnt0",cnt0);
		mv.addObject("cnt1",cnt1);
		mv.addObject("cnt2",cnt2);
		mv.addObject("cnt3",vo1.getCnt3());
		
		return mv;
	}
	
	
	//ajax
	@RequestMapping(value = "/admin/mainch", produces = {MediaType.APPLICATION_JSON_VALUE})
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

			object.addProperty("Pay1", pay1);
			object.addProperty("Pay2", pay2);


			jArray.add(object);
		}
		

		String json = gson.toJson(jArray);
		System.out.println(json.toString());
		
		return json;
	}
}
