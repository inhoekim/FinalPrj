package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.ott.security.csh.FinalUserDetail;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.UserVo;

import data.mybatis.mapper.UserMapper;

@Service
public class UserService {
	@Autowired private UserMapper mapper;
	@Autowired private PasswordEncoder pwdEncoder;
	
	public FinalUserDetail getAuths(String user_id) {
		return mapper.getAuths(user_id);
	}
	public int insert(UserVo vo) {
		String pwd=vo.getPwd();
		vo.setPwd(pwdEncoder.encode(pwd));
		return mapper.insertUser(vo);
	}
	public int insertAuth(AuthoritiesVo vo) {
		return mapper.insertAuth(vo);
	}
	public int updateUser(UserVo vo) {
		return mapper.updateUser(vo);
	}
	public int deleteUser(String user_id) {
		return mapper.deleteUser(user_id);
	}
	public UserVo selectUser(String user_id) {
		return mapper.selectUser(user_id);
	}
	
	public List<UserVo> PayList(HashMap<String, Integer> map){
		return mapper.UserList(map);
	}
	public int totalRowCnt() {
		return mapper.totalRowCnt();
	}
	public List<UserVo> AllSelect(){
		return mapper.AllSelect();
	}
}
 