package com.kh.kmanager.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderData {

	private int productNo;
	private int orderPrice;
	private int conNo;
}
