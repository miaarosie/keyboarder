package com.kh.kmanager.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PoMainData {

	// 상단 요약부분용 필드 : NEW_ORDER, SHIPPING, CONFIRMED, SUM_ORDER
	private int newOrder; // 새로운 총 주문건수
	private int shipping; // 배송중 건수
	private int confirmed; // 당일 구매확정 건수
	private int sumOrder; // 당일 주문금 합
	private int sumSettle; // 당일 정산확정금액
	
	// 판매현황용 필드 : PAYMENT_BILL, PAYMENT_COUNT, REFUND_COUNT
	private int paymentBill;
	private int paymentCount;
	private int refundCount;
	
	// 판매현황 그래프용 필드 : ORDER_PRICE, ORDER_DATE
	private int orderPrice;
	private String orderDate;
	
	// 상품 현황 : SHOW_PRODUCT, HIDE_PRODUCT
	private int showProduct;
	private int hideProduct;
	
}
