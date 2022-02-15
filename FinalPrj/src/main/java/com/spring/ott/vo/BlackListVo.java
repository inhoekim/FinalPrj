package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BlackListVo {
	private int black_id;
	private String user_id;
	Date black_start_date;
	Date black_expiry_date;
	private String content;
	private String black_enabled;
}
