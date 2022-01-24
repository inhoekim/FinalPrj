package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PostVo {
	private int post_id;
	private String user_id;
	private int category_id;
	private String title;
	private String content;
	private int hit;
	private Date created_day;
	private Date updated_day;
	
}