package com.kh.kmanager.bo.graph.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class SalesGraph {

	private String sellerName;
	private int settleDept;
	private String productName;
	private int price;
	private String attachment1;
	private String orderCount;
	
}
