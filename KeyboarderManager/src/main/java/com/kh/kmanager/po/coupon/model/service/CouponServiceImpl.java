package com.kh.kmanager.po.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.coupon.model.dao.CouponDao;
import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;


@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CouponDao couponDao;
	
	//쿠폰 인서트
	public int  insertCoupon(Coupon c) {
	
	return couponDao.insertCoupon(sqlSession, c);
	}

	//상품 가져오기
	@Override
	public ArrayList<Product> prodcutListforCoupon(int sellerNo) {
		
		return couponDao.prodcutListforCoupon(sqlSession,sellerNo);
	}

	@Override
	public ArrayList<Coupon> showAbleCouponList(Coupon c) {
		
		return couponDao.showAbleCouponList(sqlSession,c);
	}

	@Override
	public ArrayList<Coupon> ableCouponSearch(Coupon c) {
		
		return couponDao.ableCouponSearch(sqlSession,c);
	}

	@Override
	public ArrayList<Coupon> searchExCouponList(Coupon c) {
		return couponDao.searchExCouponList(sqlSession,c);
	}

	@Override
	public ArrayList<Coupon> poCouponUsedList(Coupon c) {
		return couponDao.poCouponUsedList(sqlSession,c);
	}

	@Override
	public ArrayList<Coupon> searchPoCouponUsed(Coupon c) {
		return couponDao.searchPoCouponUsed(sqlSession,c);
	
	}

	@Override
	public ArrayList<Coupon> showCouponListPo(Coupon c) {
		return couponDao.showCouponListPo(sqlSession,c);
	}

	@Override
	public ArrayList<Coupon> CouponDetailSearch(Coupon c) {
		return couponDao.CouponDetailSearch(sqlSession,c);
	}

	@Override
	public int updateCouponPo(Coupon c) {
		return couponDao.updateCouponPo(sqlSession,c);
	}

	@Override
	public Coupon detailCoupon(String couponNo) {
	
		return couponDao.detailCoupon(sqlSession,couponNo);
	}
	
}
