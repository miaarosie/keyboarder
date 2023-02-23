package com.kh.kmanager.po.settlement.model.vo;

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
public class Settlement {

	private int allBalance; // 총 잔액
	private int confirmSettlement; // 정산확정금액
	private int preSettlement; // 정산예정금액
	private int remitBalance; // 송금예정잔액
	private int ableBalance; // 출금가능잔액
	
	
	private int sellerNo;  //판매자
	private String orderNo; //주문번호
	private String settleDate; // 정산일
	private int commition; // 수수료금액
	private int settleDept; // 정산금액
	private int taxAmount; // 세액
	private int supplyValue; // 공급가액
	private String paymentNo; // 결제번호
	private String nowMonth;
	private int productNo; // 조인할 상품코드
	private int price; // 조인할 상품가격
	private int keyCouponPrice; // 조인할 키보더쿠폰가격
	private int stoCouponPrice; // 조인할 스토어쿠폰가격
	private int paymentBill; // 조인할 결제금액
	private int couponPrice;
	
	private String searchSettleDate; // 기간조회검색
	private String searchDate;
	
	private String sellerName; // 입점사명
	private int orderPrice; // 주문금액
	private int totalOrderPrice; // 총 주문 금액 (주문금액 - 쿠폰할인합계)
	private String modalWriteDate; // 세금계산서 작성일
	private String searchSettleDate2; // 입점업체 정산금 검색용 필드

	private int billPublishAmount; // 계산서발행액
	private int sales; // 매출액
	private String corpNo; // 입점업체 사업자등록번호
	private String repName; // 입점업체 대표자명
	private String sellerEmail; // 입점업체 이메일
	private String sellerPhone; // 입점업체 연락처
	private String location; // 입점업체 본사 주소
	private String productName; // 정산 제품명
	private int kcouponPrice; // 키보더 쿠폰 할인액 = 수수료 할인액
	private int scouponPrice; // 스토어 쿠폰 할인액
	private int totalCouponPrice;
 	private int realPayPrice; // 결제 금액
	private int totalDeductible; // 총 공제액
	
	public Settlement(String sellerName, String settleDate) {
		super();
		this.sellerName = sellerName;
		this.settleDate = settleDate;
	}
		
	public Settlement(int sellerNo, String searchDate) {
		super();
		this.sellerNo = sellerNo;
		this.searchDate = searchDate;
	}

}
