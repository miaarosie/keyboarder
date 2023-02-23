package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface JKW_OrderService {
	
	// PO 배송관리 전체조회 배송중 개수 파악
	int orderStatus1(int selNo);

	// PO 배송관리 전체조회 배송완료 개수 파악
	int orderStatus2(int selNo);
	
	// PO 배송관리 전체조회 구매확정 개수 파악
	int orderStatus3(int selNo);
	
	// PO 배송관리 전체조회 환불 개수 파악
	int orderStatus4(int selNo);
	
	// PO 배송관리 전체조회 주문건수 파악
	int orderCount(int selNo);
	
	// PO 배송관리 전체 조회
	ArrayList<PoOrder> orderList(int selNo);

	// PO 배송관리 월별 조회
	ArrayList<PoOrder> deliverySearchDate(PoOrder poOrder);

	// PO 배송관리 월별조회 배송중 개수 파악
	int dateOrderStatus1(PoOrder poOrder);

	// PO 배송관리 월별조회 배송완료 개수 파악
	int dateOrderStatus2(PoOrder poOrder);

	// PO 배송관리 월별조회 구매확정 개수 파악
	int dateOrderStatus3(PoOrder poOrder);

	// PO 배송관리 월별조회 환불 개수 파악
	int dateOrderStatus4(PoOrder poOrder);

	// PO 배송관리 월별조회 주문건수 파악
	int dateOrderCount(PoOrder poOrder);
}
