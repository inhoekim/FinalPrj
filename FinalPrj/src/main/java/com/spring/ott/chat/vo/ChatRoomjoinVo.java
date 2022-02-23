package com.spring.ott.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoomjoinVo {
	private String user_id;
	private String name;
	private int age;
	private int profile_id;
	private char enabled;
	
	private int joinid; // 연결아이디
	private Date joincontime; // 마지막 접속시간
	private int crid; // 채팅방아이디(시퀀스)
}
