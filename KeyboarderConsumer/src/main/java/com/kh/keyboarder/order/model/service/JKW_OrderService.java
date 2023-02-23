package com.kh.keyboarder.order.model.service;

import java.util.ArrayList;

import com.kh.keyboarder.order.model.vo.Order;

public interface JKW_OrderService {
	
	/**
	 * FO 주문내역 전체 조회 
	 * * 주멋돌
	 */
	ArrayList<Order> foTotalViewList(int conNo);
	
	/**
	 * FO 주문내역 상세 조회 
	 * * 주멋돌
	 */
	Order foDetailViewList(String ordNo);
	
	/**
	 * FO 주문내역 월별 조회 
	 * * 주멋돌
	 */
	ArrayList<Order> foSearchDate(Order order);
}
