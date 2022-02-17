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
	private int comCnt;
	private int voCnt;
	private String cname;
	private int subcate;
	//가상칼럼
	private String post_profile;
}
