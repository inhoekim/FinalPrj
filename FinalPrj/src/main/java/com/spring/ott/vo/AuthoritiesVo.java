package com.spring.ott.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AuthoritiesVo {
	private int role_id;
	private String user_id;
	private String authority;
}
