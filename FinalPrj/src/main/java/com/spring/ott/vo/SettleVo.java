package com.spring.ott.vo;

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
	private int settle_day;	
}
