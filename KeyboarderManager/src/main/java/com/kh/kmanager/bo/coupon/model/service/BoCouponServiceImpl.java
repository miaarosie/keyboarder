package com.kh.kmanager.bo.coupon.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.coupon.model.dao.BoCouponDao;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

import oracle.net.aso.b;

@Service
public class BoCouponServiceImpl implements BoCouponService {

	@Autowired
	private BoCouponDao couponDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<BoCoupon> selectCouponList(BoCoupon bc) {
		return couponDao.selectCouponList(sqlSession, bc);
	}

	@Override
	public int insertCoupon(BoCoupon bc) {
		return couponDao.insertCoupon(sqlSession, bc);
	}

	@Override
	public ArrayList<BoCoupon> usedCouponList(BoCoupon bc) {
		return couponDao.usedCouponList(sqlSession, bc);
	}

	@Override
	public BoCoupon selectCoupon(String cno) {
		return couponDao.selectCoupon(sqlSession, cno);
	}

	@Override
	public int updateCoupon(BoCoupon bc) {
		return couponDao.updateCoupon(sqlSession, bc);
	}

}
