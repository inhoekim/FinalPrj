package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class PayMentVo {
	private String payment_id;
	private String user_id;
	private int price;
	private int status;
	private Date payment_date;
}
