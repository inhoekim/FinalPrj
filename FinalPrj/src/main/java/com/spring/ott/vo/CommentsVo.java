package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVo {
	private int comment_id;
	private int post_id;
	private String user_id;
	private String content;
	private int ref;
	private int lev;
	private int step;
	private Date created_day;
	private Date updated_day;
	
}