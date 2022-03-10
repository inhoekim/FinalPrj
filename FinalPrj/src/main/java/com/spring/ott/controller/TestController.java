package com.spring.ott.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.ott.service.RedisWatingRoomService;

@Controller
public class TestController {
	@Autowired StringRedisTemplate stringRedisTemplate;
	@Autowired RedisWatingRoomService redisWatingRoomService;
	
	@GetMapping("/inhoe/test")
	public String test() {
		stringRedisTemplate.opsForValue().set("test2", "gogo");
		return "redirect:/home";
	}
}
