package com.kh.kmanager.bo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Store {

	private int sellerNo; //SELLER_NO	NUMBER
	private String sellerName; //SELLER_NAME	VARCHAR2(50 BYTE)
	private String repName; //REP_NAME	VARCHAR2(20 BYTE)
	private String sellerId; //SELLER_ID	VARCHAR2(20 BYTE)
	private String sellerPwd; //SELLER_PWD	VARCHAR2(20 BYTE)
	private String sellerEmail; //SELLER_EMAIL	VARCHAR2(50 BYTE)
	private String sellerPhone; //SELLER_PHONE	CHAR(13 BYTE)
	private String corpNo; //CORP_NO	CHAR(12 BYTE)
	private String accountNo; //ACCOUNT_NO	VARCHAR2(20 BYTE)
	private String joinDate; //JOIN_DATE	DATE // String
	private String location; //LOCATION	VARCHAR2(100 BYTE)
	private String sellerStatus; //SELLER_STATUS	CHAR(1 BYTE)
	private String identifyStatus; //IDENTIFY_STATUS	CHAR(1 BYTE)
	private String logoAttachment; //LOGO_ATTACHMENT	VARCHAR2(500 BYTE)

}
