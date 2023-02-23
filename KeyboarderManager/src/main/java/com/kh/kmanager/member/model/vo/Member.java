package com.kh.kmanager.member.model.vo;

import java.sql.Date;

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
	
	private int sellerNo; // 판매업체 번호 
	private String sellerName; // 판매업체명
	private String repName; // 판매업체 대표자명
	private String sellerId; // 판매업체 아이디
	private String sellerPwd; // 판매업체 비밀번호
	private String sellerEmail; // 판매업체 이메일
	private String sellerPhone; // 판매업체 전화번호
	private String corpNo; // 판매업체 사업자등록번호
	private String accountNo; // 판매업체 계좌번호
	private Date joinDate; // 판매업체 가입일
	private String location; // 판매업체 본사주소
	private String sellerStatus; // 판매업체 가입상태
	private String identifyStatus; // 가입승인여부
	private int mailAuth; // 판매업체 이메일 인증여부
	private String mailKey; // 판매업체 이메일 인증 키
	private String logoAttachment; // 판매업체 로고
	
	public Member(String sellerId, String corpNo, String sellerPwd) {
		super();
		this.sellerId = sellerId;
		this.corpNo = corpNo;
		this.sellerPwd = sellerPwd;
	}

	public Member(String sellerName, String repName, String sellerId, String sellerPwd, String sellerEmail,
			String sellerPhone, String corpNo, String accountNo, String location, String logoAttachment) {
		super();
		this.sellerName = sellerName;
		this.repName = repName;
		this.sellerId = sellerId;
		this.sellerPwd = sellerPwd;
		this.sellerEmail = sellerEmail;
		this.sellerPhone = sellerPhone;
		this.corpNo = corpNo;
		this.accountNo = accountNo;
		this.location = location;	
		this.logoAttachment = logoAttachment;
	}

	public Member(String sellerName, String repName, String sellerEmail, String sellerPhone, String accountNo,
			String location) {
		super();
		this.sellerName = sellerName;
		this.repName = repName;
		this.sellerEmail = sellerEmail;
		this.sellerPhone = sellerPhone;
		this.accountNo = accountNo;
		this.location = location;
	}
	
	
	
	
}
