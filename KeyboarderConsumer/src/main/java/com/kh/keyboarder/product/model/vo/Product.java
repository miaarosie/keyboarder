package com.kh.keyboarder.product.model.vo;

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
public class Product {

	private int productNo; // 상품식별키
	private String productName; // 상품명
	private int price; // 상품 가격
	private String description; // 상품 설명
	private String attachment1; // 첨부파일1(썸네일)
	private String attachment2; // 첨부파일
	private String attachment3; // 첨부파일
	private String attachment4; // 첨부파일
	private int productStatus; // 상품공개여부
	private int sellerNo; // 판매자 식별키
	private String stoCouponNo;
	private String keyCouponNo;
	private String stoCouponName;
	private String keyCouponName;
	private int stoCouponPrice;
	private int keyCouponPrice;
	private int stoProductNo;
	private int keyProductNo;
	

}
