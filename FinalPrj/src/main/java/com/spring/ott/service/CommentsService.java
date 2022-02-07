package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.CommentsVo;

import data.mybatis.mapper.CommentsMapper;

@Service
public class CommentsService {
	@Autowired CommentsMapper mapper;
	public List<CommentsVo> selectAll(int post_id){
		return mapper.selectAll(post_id);
	}
	public int getNum() {
		return mapper.getNum();
	}
	public 	int addStep(HashMap<String, Object> map) {
		return mapper.addStep(map);
	}
	public int insertComment(CommentsVo vo) {
		return mapper.insertComment(vo);
	}
	public int insertReComment(CommentsVo vo) {
		return mapper.insertReComment(vo);
	}
	public int reCheck(int ref) {
		return mapper.reCheck(ref);
	}
	public CommentsVo selectComm(int comment_id) {
		return mapper.selectComm(comment_id);
	}
	public int getCount(int post_id) {
		return mapper.getCount(post_id);
	}
}
