package com.spring.ott.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserVo {
	
	@NotEmpty
	private String user_id;
	
	@NotEmpty
	private String pwd;
	
	@NotEmpty
	@Pattern(regexp ="^[가-힣]{2,6}$")
	private String name;
	
	private String jnum;
	
	@NotEmpty
	@Pattern(regexp ="[0-9]{6}")
	private String jnum1;
	
	@NotEmpty
	@Pattern(regexp="[0-9]{7}")
	private String jnum2;
	
	@NotEmpty
	private int age;
	
	@NotEmpty
	private String area;
	
	@NotEmpty
	@Email
	private String email;
	
	private Date regdate;
	private String enabled;
	private String black_enabled;
}
