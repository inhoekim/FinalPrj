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
	private String target_id;
	private String title;
	private String content;
	private int why;
	private Date created_day;
	private int result;
	private int post_id;
	private int comment_id;
	//가상칼럼
	private String my_profile;
	private String target_profile;
}


