package com.spring.ott.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MatchingVo {
	private int party_id;
	private String user_id;
	private String payment_id;
	private String next_payment_id;
	private Date matching_date;
}
