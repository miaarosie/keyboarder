package com.kh.keyboarder.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PGData {

	private String paymentNo; // 결제번호 // imp_uid
	private String orderNo; // 주문번호 // merchant_uid
	private int productNo; // 상품번호
	private String amount; // 실결제액
	private int conNo; // 소비자번호
	private int paymentBill; // 결제금액
	private int orderPrice; // 주문금액
	private int couponPrice; // 쿠폰금액
	private int sellerNo; // 판매자번호
	private int commition; // 수수료금액
	private int settleDept; // 정산금액
	private int taxAmount; // 세액
	private int supplyValue; // 공급가액
	private String couponNo;
}
