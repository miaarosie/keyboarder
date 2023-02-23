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
public class Withdraw {

	private int sellerNo;
	private String withdrawDate;
	private int withdrawMoney;
	private String accountNo;
	private String repName;
	private String reqResult;
	private String sellerName;
	private String startDate;
	private String endDate;
}
