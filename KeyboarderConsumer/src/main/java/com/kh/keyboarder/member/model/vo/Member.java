package com.kh.keyboarder.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor 
@Setter
@Getter
@ToString
public class Member {

	private int conNo;
	private String conName;
	private String conId;
	private String conPwd;
	private String address; 
	private String conPhone;
	private String conEmail;
	private String mailKey;
	private String mailAuth;
	
	
}
