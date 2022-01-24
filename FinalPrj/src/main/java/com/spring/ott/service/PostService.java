package com.spring.ott.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return mapper.FileInsert(vo);
	}
}
