package com.spring.ott.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class CategoryVo {
	private int category_id;
	private String category_name;
	private String board_address;
}
