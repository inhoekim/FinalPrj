package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.UserProfileVo;
import com.spring.ott.vo.VoteVo;

import data.mybatis.mapper.VoteMapper;

@Service
public class VoteService {
	@Autowired VoteMapper mapper;
	public int insertPostLike(VoteVo vo) {
		return mapper.insertPostLike(vo);
	}
	public int insertCommLike(VoteVo vo) {
		return mapper.insertCommLike(vo);
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
	public VoteVo checkComm(HashMap<String, Object> map) {
		return mapper.checkComm(map);
	}
	public int deleteCommLike(HashMap<String, Object> map) {
		return mapper.deleteCommLike(map);
	}
	public List<UserProfileVo> getLikeList(int post_id) {
		return mapper.getLikeList(post_id);
	}
	public int delete(int comment_id) {
		return mapper.delete(comment_id);
	}
	public int delPostVote(int post_id) {
		return mapper.delPostVote(post_id);
	}
}
