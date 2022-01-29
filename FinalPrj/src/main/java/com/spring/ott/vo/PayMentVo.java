package com.spring.ott.vo;

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
	private String price;
	private String status;
	private String payment_date;
}
