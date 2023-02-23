package com.kh.kmanager.bo.graph.model.service;

import java.util.ArrayList;


import com.kh.kmanager.bo.graph.model.vo.SalesGraph;
import com.kh.kmanager.po.product.model.vo.Product;

public interface BoGraphService {

	// 월별 매출통계 조회용
	ArrayList<SalesGraph> selectSalesGraph(int month);
	
	// 전체 월 평균 매출 통계 조회용
	ArrayList<SalesGraph> selectAvgSalesGraph();

	//전체 상품 통계 조회용
	ArrayList<SalesGraph> selectopProduct();

	//상품 가져오기
	ArrayList<SalesGraph> showProductImages();
}
