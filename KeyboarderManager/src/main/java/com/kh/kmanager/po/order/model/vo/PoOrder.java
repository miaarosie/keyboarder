package com.kh.kmanager.po.order.model.vo;

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
public class PoOrder {

	private String orderNo; // 주문번호
	private String orderDate; // 주문일시
	private int orderPrice; // 주문금액
	private String couponYN; // 쿠폰사용여부
	private String orderStatus; //구매상태
	private int productNo; //상품키
	private int conNo; // 고객번호
	
	private Date settleDate; //조인할 정산일
	private String keyMoneyDate; // 조인할 k머니지급일
	private String productName; // 조인할 상품명
	private String conId; // 조인할 구매자아이디
	private String conName; // 조인할 구매자명
	
	private int sellerNo; //조인할 셀러명
	private int price; //조인할 상품가격
	private int commition; //조인할 수수료
	private int couponPrice; //조인할 쿠폰가격
	private int keyboarderCouponPrice;
	private int marketCouponPrice;
	private int commitionFin;
	private int settleDept;
	private String startDate;
	private String endDate;
	
	private String nowMonth;  // 조회용
	
	private String searchDecisionDate; // 기간조회검색
	private String searchDate;
	
	private String conPhone;
	private int commission;

	private int productPrice; // 상품 가격
	private int keyCouponPrice; // PO 쿠폰 가격
	private int stoCouponPrice; // BO 쿠폰 가격
	private String sellerName;
	
	private int supplyValue; // 품목 판매단가(공급가액) -> 상품금액 / 1.1
	private String couponType; // 사용한 쿠폰 종류
	private int paymentBill; // 정산기준금액(결제금액)
	private String excelDate;
	
	private String paymentNo;
	
	private String printOrder; // 옵션검색(ajax) 후 조회된 데이터의 값 저장용 필드(엑셀 다운로드기능 시 필요)
	
	public PoOrder(int sellerNo, String searchDate) {
		super();
		this.sellerNo = sellerNo;
		this.searchDate = searchDate;
	}
	
	public String printOrder() {
		return "orderNo=" + this.orderNo + "/orderDate=" + this.orderDate + "/orderStatus=" + this.orderStatus +
			   "/productName=" + this.productName + "/orderPrice=" + this.orderPrice + "/conId=" + this.conId + "/conName=" + this.conName;
	}

}
