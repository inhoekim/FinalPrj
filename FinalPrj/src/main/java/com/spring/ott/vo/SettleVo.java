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
public class SettleVo {
	private int settle_id;
	private int party_id;
	private String target_id;
	private int price;
	private int settle_state;
	private Date settle_day;
	private int bank_id;
	private String bank_account;
}
