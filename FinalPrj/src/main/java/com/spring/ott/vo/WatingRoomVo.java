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
public class WatingRoomVo {
	private int wating_id;
	private String user_id;
	private int ott_id;
	private Date start_day;
}
