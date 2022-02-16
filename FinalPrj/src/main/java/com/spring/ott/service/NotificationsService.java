package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.vo.NotificationsVo;

import data.mybatis.mapper.NotificationsMapper;

@Service
public class NotificationsService {
	@Autowired NotificationsMapper mapper;
	public List<NotificationsVo> selectAll(String user_id){
		return mapper.selectAll(user_id);
	}
	public int postNoti(NotificationsVo vo) {
		return mapper.postNoti(vo);
	}
	public int commNoti(NotificationsVo vo) {
		return mapper.commNoti(vo);
	}
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
	public int deleteCommNoti(HashMap<String, Object> map) {
		return mapper.deleteCommNoti(map);
	}
}
