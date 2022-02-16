package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AccusationVo {
	private int accusate_id;
	private String user_id;
	private int category_id;
	private String target_id;
	private String title;
	private String content;
	private Date created_day;
	private int post_id;
	private int comment_id;
}
