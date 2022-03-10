package com.spring.ott.service;

import java.util.List;

public interface RedisWatingRoomService {
	public boolean addWatingUser(String userId, int ott_id);
	public boolean popWatingUser(int range, int ott_id);
	public boolean removeWatingUser(String userId, int ott_id);
	public List<String> getWatingUser(int ott_id);
	public int checkUser(String userId);
}
