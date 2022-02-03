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
public class PartyVo {
	private int party_id;
	private int ott_id;
	private String leader;
	private int member_num;
	private String invite_code;
	private int party_state;
	private String share_id;
	private String share_pwd;
	private Date expiration_date;
	private Date start_day;
}
