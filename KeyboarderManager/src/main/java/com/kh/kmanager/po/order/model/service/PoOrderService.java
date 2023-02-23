package com.kh.kmanager.po.order.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface PoOrderService {
	
	// 구매확정내역 리스트 조회(기본으로 해당월 조회)
	ArrayList<PoOrder> selectDecisionOrder(PoOrder poOrder);
	
	// 구매확정내역 기간별 조회
	ArrayList<PoOrder> searchPoOrderDecision(PoOrder poOrder);
	
	// 현재 월의 전체주문내역 리스트 조회 서비스
	int selectListCount(HashMap<String, String> optionDefault); // 해당 PO의 현재 월의 주문내역 총 개수
	ArrayList<PoOrder> selectAllOrderList(HashMap<String, String> optionDefault); // 해당 PO의 현재 월의 주문내역 리스트
	
	// PO 전체주문내역 검색옵션으로 리스트 조회 서비스
	ArrayList<PoOrder> selectOrderList(HashMap<String, String> option);

	// 구매확정내역 (해당월)엑셀다운로드
	ArrayList<PoOrder> orderDecisionList(PoOrder poOrder);
	
	// 구매확정내역 기간별조회 엑셀다운로드
	ArrayList<PoOrder> searchExcelDecisionList(PoOrder poOrder);

	// 환불 관련 메소드
	String getToken() throws IOException;
	int paymentInfo(String paymentNo, String token) throws IOException;
	int orderCancel(PoOrder pgd);
	public void payMentCancel(String access_token, String imp_uid, int amount, String reason) throws IOException;
	
}
