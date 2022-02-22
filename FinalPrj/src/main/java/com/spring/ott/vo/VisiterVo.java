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
	
	private String payment_date;
	private int Pay1;
	private int Pay2;
	private int Pay3;
	private int Pay4;
	private int Pay5;
	private int Pay6;
	private int Pay7;
	private int Pay11;
	private int Pay12;
	private int Pay13;
	private int Pay14;
	private int Pay15;
	private int Pay16;
	private int Pay17;
	private int Pay21;
	private int Pay22;
	private int Pay23;
	private int Pay24;
	private int Pay25;
	private int Pay26;
	private int Pay27;
	
	// 메인페이지 파티 카운터 변수
	private int cnt0;
	private int cnt1;
	private int cnt2;
	private int cnt3;
}
