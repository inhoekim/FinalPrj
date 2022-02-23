package com.spring.ott.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.ott.security.csh.FinalUserDetail;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.BlackListVo;
import com.spring.ott.vo.MemberVo;
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
	public int deleteChk(String user_id, String pwd) {
		return mapper.deleteChk(user_id, pwd);
	}
	public int blackUser(String user_id) {
		return mapper.blackUser(user_id);
	}
	public int unBlackUser(String user_id) {
		return mapper.unBlackUser(user_id);
	}
	public String findId(String name, String email) {
		return mapper.findId(name, email);
	}
	public UserVo findPwdChk(String user_id, String email) {
		return mapper.findPwdChk(user_id, email);
	}
	public int findPwd(UserVo vo) {
		return mapper.findPwd(vo);
	}
	public UserVo selectUser(String user_id) {
		return mapper.selectUser(user_id);
	}
	
	public List<UserVo> userList(HashMap<String, Integer> map){
		return mapper.userList(map);
	}
	public int totalRowCnt() {
		return mapper.totalRowCnt();
	}
	public List<UserVo> AllSelect(){
		return mapper.AllSelect();
	}
	
	//김인회
	public MemberVo selectMember (String user_id) {
		return mapper.selectMember(user_id);
	}
}
 