package com.spring.ott.chat.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatMessageVo {
	private int msgid;
	private String msgmessage;
	private Date msgtime;
	private String msgsysmsg;
	private String user_id;
	private int crid;
	//추가사항
	private String msgshottime;//ex.오후 1:02
	private String name;
	private int profile_id;
}
