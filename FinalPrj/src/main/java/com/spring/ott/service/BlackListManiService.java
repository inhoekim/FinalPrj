package com.spring.ott.service;

import com.spring.ott.vo.BlackListVo;

public interface BlackListManiService {
	public int enrollBlackList(String user_id, BlackListVo bVo);
}
