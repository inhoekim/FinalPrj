package com.spring.ott.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class NotificationsVo {
	private int notify_id;
	private String user_id;
	private int post_id;
	private int notify_type;
	private String sender_id;
	private int comment_id;
}
