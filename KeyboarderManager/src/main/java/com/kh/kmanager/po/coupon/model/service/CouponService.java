package com.kh.kmanager.po.coupon.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;

public interface CouponService {
	
	//상품리스트를 가져오는 메소드
	ArrayList<Product> prodcutListforCoupon(int sellerNo);
	
	//쿠폰을 인서트 하는 메소드
	int insertCoupon(Coupon c);
	
	//사용가능한 쿠폰 전체조회하는 메소드
	ArrayList<Coupon> showAbleCouponList(Coupon c);
	
	//사용가능한 쿠폰 기간조회하는 메소드
	ArrayList<Coupon> ableCouponSearch(Coupon c);

	//사용만료된 쿠폰 기간조회하는 메소드
	ArrayList<Coupon> searchExCouponList(Coupon c);

	
	//사용한 쿠폰 전체 조회하는 메소드
	ArrayList<Coupon> poCouponUsedList(Coupon c);

	//사용한 쿠폰 기간 조회하는 메소드
	ArrayList<Coupon> searchPoCouponUsed(Coupon c);

	//전체  쿠폰내역을 가져오는 메소드
	ArrayList<Coupon> showCouponListPo(Coupon c);
	
	//기간, 상태별로 조회하는 메소드
	ArrayList<Coupon> CouponDetailSearch(Coupon c);

	//쿠폰을 수정하는 메소드
	int updateCouponPo(Coupon c);

	//쿠폰 상세조회
	Coupon detailCoupon(String couponNo);

	
	
	
	
	

}
