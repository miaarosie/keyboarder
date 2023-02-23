package com.kh.keyboarder.product.model.vo;

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
public class JKW_Coupon {

	private String couponNo; 
	private String couponName;
	private int couponPrice;
	private Date createDate;
	private Date yseDate;
	private Date dueDate;
	private String couponStmt;
	private int sellerNo;
	private int productNo;	
}
