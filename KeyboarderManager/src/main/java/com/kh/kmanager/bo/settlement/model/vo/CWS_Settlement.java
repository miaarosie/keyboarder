package com.kh.kmanager.bo.settlement.model.vo;

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
public class CWS_Settlement {
	
	private int sellerNo; // 입점사코드
	private String sellerName; // 입점사명
	private String orderNo; // 주문번호
	private int orderPrice; // 주문금액
	private int totalOrderPrice; // 총 주문 금액 (주문금액 - 쿠폰할인합계)
	private String settleDate; // 정산일
	private String modalWriteDate; // 세금계산서 작성일
	private String searchSettleDate2; // 입점업체 정산금 검색용 필드
	private int commition; // 수수료
	private int settleDept; // 정산금액
	private int taxAmount; // 세액
	private int supplyValue; // 공급가액
	private int billPublishAmount; // 계산서발행액
	private int sales; // 매출액
	private String paymentNo; // 결제번호
	private String corpNo; // 입점업체 사업자등록번호
	private String repName; // 입점업체 대표자명
	private String sellerEmail; // 입점업체 이메일
	private String sellerPhone; // 입점업체 연락처
	private String location; // 입점업체 본사 주소
	private String productName; // 정산 제품명
	private int price; // 주문가격
	private int kcouponPrice; // 키보더 쿠폰 할인액 = 수수료 할인액
	private int scouponPrice; // 스토어 쿠폰 할인액
	private int totalCouponPrice;
 	private int realPayPrice; // 결제 금액
	private int totalDeductible; // 총 공제액
 	
	
	public CWS_Settlement(String sellerName) {
		super();
		this.sellerName = sellerName;
	}

	public CWS_Settlement(String sellerName, String settleDate) {
		super();
		this.sellerName = sellerName;
		this.settleDate = settleDate;
	}

	public CWS_Settlement(String sellerName, String orderNo, String settleDate) {
		super();
		this.sellerName = sellerName;
		this.orderNo = orderNo;
		this.settleDate = settleDate;
	}
		
	public CWS_Settlement(String corpNo, String sellerName, String repName, String location, String sellerEmail, String sellerPhone
						, int supplyValue, int taxAmount, int price, String settleDate) {
		this.corpNo = corpNo;
		this.sellerName = sellerName;
		this.repName = repName;
		this.location = location;
		this.sellerEmail = sellerEmail;
		this.sellerPhone = sellerPhone;
		this.supplyValue = supplyValue;
		this.taxAmount = taxAmount;
		this.price = price;
		this.settleDate = settleDate;
	}

	public CWS_Settlement(int sellerNo, String sellerName, String settleDate, String searchSettleDate2) {
		super();
		this.sellerNo = sellerNo; // 사실 필요없는데 생성자 생성을 위한 더미 필드
		this.sellerName = sellerName;
		this.settleDate = settleDate;
		this.searchSettleDate2 = searchSettleDate2;
	}
	
}