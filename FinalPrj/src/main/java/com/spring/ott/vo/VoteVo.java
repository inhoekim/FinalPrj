package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class VoteVo {
	private int vote_id;
	private int post_id;
	private int comment_id;
	private String user_id;
	private Date created_day;
}
