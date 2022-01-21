package com.spring.ott.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Data
public class SubscribeVo {
	private String subscriber_id;
	private String target_userid;
}
