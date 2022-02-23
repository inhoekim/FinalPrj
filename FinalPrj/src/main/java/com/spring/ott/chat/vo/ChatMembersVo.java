package com.spring.ott.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class ChatMembersVo {
	/*
	private String cmid;
	private String cmname;
	private Date cmbirth;
	private String cmprofile;
	private String cmscname;
	private String cmdrop;
	*/
	//private String cbbuid;
	
	// 아이디num 시퀀스
	private int user_id_num;
	// 아이디
	private String user_id;
	// 이름
	private String name;
	// 나이
	private int age;
	// 프로필 사진 이미지파일 이름 (FK)
	private int profile_id;
	// 유저 상태(0:탈퇴 / 1:정상)
	private char enabled;
}
