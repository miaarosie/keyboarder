package com.kh.kmanager.bo.coupon.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

public interface BoCouponService {
	
	// 쿠폰 전체 조회용
	ArrayList<BoCoupon> selectCouponList(BoCoupon bc);

	// 쿠폰 등록용
	int insertCoupon(BoCoupon bc);
	
	ArrayList<BoCoupon> usedCouponList(BoCoupon bc);
	
	BoCoupon selectCoupon(String cno);
	
	int updateCoupon(BoCoupon bc);
}
