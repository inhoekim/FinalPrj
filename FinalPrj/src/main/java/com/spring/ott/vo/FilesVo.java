package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data
public class FilesVo {
	private int file_id;
	private int post_id;
	private String file_type;
	private int file_size;
	private String org_name;
	private String src_name;
	private Date created_day;
}
