package com.kh.kmanager.bo.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.kmanager.bo.order.model.vo.Order;

public interface OrderService {

	// 현재 월의 전체주문내역 리스트 조회 서비스
	int selectListCount(String nowMonth); // 현재 월의 주문내역 총 개수
	ArrayList<Order> selectAllOrderList(String nowMonth);
	
	// 검색 옵션 있을때 주문내역 리스트 조회 서비스
	ArrayList<Order> selectOrderList(HashMap<String, String> option);
}
