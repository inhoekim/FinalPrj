package com.spring.ott.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RedisWatingRoomServiceImpl implements RedisWatingRoomService{
	@Autowired StringRedisTemplate stringRedisTemplate;
	
	@Transactional
	public boolean addWatingUser(String userId, int ott_id) {
		stringRedisTemplate.opsForValue().set("user:" + userId, Integer.toString(ott_id));
		stringRedisTemplate.opsForList().rightPush("watingRoom" + ott_id, userId);
		return true;
	}
	
	@Transactional
	public boolean popWatingUser(int range, int ott_id) {
		for(int i = 0; i < range; i++) {
			String userId = stringRedisTemplate.opsForList().leftPop("watingRoom" + ott_id);
			stringRedisTemplate.delete("user:" + userId);
		}
		return true;
	}
	
	
	@Transactional
	public boolean removeWatingUser(String userId, int ott_id) {
		stringRedisTemplate.opsForList().remove("watingRoom" + ott_id,0,userId);
		stringRedisTemplate.delete("user:" + userId);
		return true;
	}
	
	public List<String> getWatingUser(int ott_id) {
		System.out.println("watingRoom" + ott_id);
		List<String> users = stringRedisTemplate.opsForList().range("watingRoom" + ott_id, 0, 2);
		System.out.println("users size: " + users.size());
		return users;
	}
	
	public int checkUser(String userId) {
		if(stringRedisTemplate.opsForValue().get("user:" + userId) == null) {
			return -1;
		}
		return Integer.parseInt(stringRedisTemplate.opsForValue().get("user:" + userId));
	}
	
}
