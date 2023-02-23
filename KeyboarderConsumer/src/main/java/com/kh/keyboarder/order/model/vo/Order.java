package com.kh.keyboarder.order.model.vo;

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
public class Order {

	private String orderNo; // 주문번호
	private String orderDate; // 주문일시
	private int orderPrice; // 주문 금액
	private String couponYN; // 쿠폰 사용 여부
	private String orderStatus; // 구매 상태
	private int productNo; // 상품키
	private int conNo; // 고객번호
	private String productAttachment; // 상품사진
	private String productName; // 상품명
	private int productPrice; // 상품 가격
	private int keyCouponPrice; // PO 쿠폰 가격
	private int stoCouponPrice; // BO 쿠폰 가격
	private String conName; // 구매자 이름
	private String conPhone; // 구매자 휴대폰 번호
	private String conAddress; // 구매자 주소
	private String sellerName; // 판매업체명
	private String searchDate;
	private int paymentBill;

	private String paymentNo; // 결제번호

	public Order(int conNo, String searchDate) {
		super();
		this.conNo = conNo;
		this.searchDate = searchDate;
	}
	
}






























