package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserVo {
	private String user_id;
	private String pwd;
	private String name;
	private String jnum;
	private int age;
	private String area;
	private String email;
	private Date regdate;
	private int state;
}
