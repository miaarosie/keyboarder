package com.kh.keyboarder.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderData {

	private int productNo;
	private int orderPrice;
	private int conNo;
	
	public OrderData() { }

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	@Override
	public String toString() {
		return "OrderData [productNo=" + productNo + ", orderPrice=" + orderPrice + ", conNo=" + conNo + "]";
	}
	
}
