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
public class VisiterVo {
	private String ip_address;
	private Date visit_date;
	
	//가상 컬럼
	private int count;
	private String visit_date2;
}
