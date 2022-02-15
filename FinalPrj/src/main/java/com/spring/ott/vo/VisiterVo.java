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
	private int count1;
	private String visit_date2;
	private int age10;
	private int age20;
	private int age30;
	private int age40;
	private String Day1;
	private String Day2;
	private String Day3;
	private String Day4;
	private String Day5;
	private String Day6;
	private String Day7;
}
