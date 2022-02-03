package com.spring.ott.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OttVo {
	private int ott_id;
	private String ott_name;
	private int month_price;
	private String domain_addr;
}
