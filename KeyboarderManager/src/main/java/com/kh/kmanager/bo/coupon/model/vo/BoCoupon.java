package com.kh.kmanager.bo.coupon.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoCoupon {
	
	private String couponNo; //	COUPON_NO	CHAR(8 BYTE)
	private String couponName; //	COUPON_NAME	VARCHAR2(100 BYTE)
	private int couponPrice; //	COUPON_PRICE	NUMBER
	private String createDate; //	CREATE_DATE	DATE
	private String useDate; //	USE_DATE	DATE
	private String dueDate; //	DUE_DATE	DATE
	private String couponStmt; //	COUPON_STMT	CHAR(1 BYTE)
	private int productNo; //	PRODUCT_NO	NUMBER
	private String productName;
	private String startDate; // 검색 기간 시작일
	private String endDate; // 검색 기간 종료일
	
	private int orderPrice;
	private String orderNo;
	private String paymentBill;
	private String sellerName;
}
