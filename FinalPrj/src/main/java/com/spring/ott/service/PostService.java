package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.CategoryVo;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.FilesVo;
import com.spring.ott.vo.PostVo;

import data.mybatis.mapper.PostMapper;

@Service
public class PostService {
	@Autowired PostMapper mapper;
	public int postInsert(PostVo vo) {
		return mapper.postInsert(vo);
	}
	public int fileInsert(FilesVo vo) {
		return mapper.fileInsert(vo);
	}
	public List<PostVo> postList(HashMap<String, Object> map){
		return mapper.postList(map);
	}
	public PostVo postDetail(int post_id) {
		return mapper.postDetail(post_id);
	}
	public List<PostVo> recentPost(){
		return mapper.recentPost();
	}
	public List<PostVo> bestPost(){
		return mapper.bestPost();
	}
	public int addHit(int post_id) {
		return mapper.addHit(post_id);
	}
	public int count(HashMap<String, Object> map) {
		return mapper.count(map);
	}
	public int delete(int post_id) {
		return mapper.delete(post_id);
	}
	public int update(PostVo vo) {
		return mapper.update(vo);
	}
	public List<CategoryVo> category(){
		return mapper.category();
	}
	public PostVo one(int post_id) {
		return mapper.one(post_id);
	}
	public List<PostVo> userPost(String user_id){
		return mapper.userPost(user_id);
	}
	public List<CommentsVo> userComment(String user_id){
		return mapper.userComment(user_id);
	}
	public List<PostVo> partyPost(){
		return mapper.partyPost();
	}
}
