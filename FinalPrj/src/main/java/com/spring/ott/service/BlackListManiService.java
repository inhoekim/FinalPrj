package com.spring.ott.service;

import com.spring.ott.vo.BlackListVo;
import com.spring.ott.vo.UserVo;

public interface BlackListManiService {
	public int blackListInsert(UserVo uVo, BlackListVo bVo);
}
