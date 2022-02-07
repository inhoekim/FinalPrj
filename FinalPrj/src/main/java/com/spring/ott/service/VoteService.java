package com.spring.ott.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.VoteVo;

import data.mybatis.mapper.VoteMapper;

@Service
public class VoteService {
	@Autowired VoteMapper mapper;
	public int insertLike(VoteVo vo) {
		return mapper.insertLike(vo);
	}
	public int deleteLike(HashMap<String, Object> map) {
		return mapper.deleteLike(map);
	}
	public VoteVo checkLike(HashMap<String, Object> map) {
		return mapper.checkLike(map);
	}
	public int likeCount(int post_id) {
		return mapper.likeCount(post_id);
	}
}
