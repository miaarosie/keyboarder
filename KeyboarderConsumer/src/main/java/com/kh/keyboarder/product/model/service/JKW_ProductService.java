package com.kh.keyboarder.product.model.service;

import java.util.ArrayList;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

public interface JKW_ProductService {

	/**
	 * FO 상품 전체 조회 페이징 처리를 위한 상품 개수 확인
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	int selectListCount();
	
	/**
	 * FO 상품 전체 조회
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	ArrayList<Product> selectList(PageInfo pi);
	
}
