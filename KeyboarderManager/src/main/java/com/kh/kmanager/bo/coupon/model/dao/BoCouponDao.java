package com.kh.kmanager.bo.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

@Repository
public class BoCouponDao {

	public ArrayList<BoCoupon> selectCouponList(SqlSessionTemplate sqlSession, BoCoupon bc) {
		return (ArrayList)sqlSession.selectList("boCouponMapper.selectCouponList", bc);
	}

	public int insertCoupon(SqlSessionTemplate sqlSession, BoCoupon bc) {
		return sqlSession.insert("boCouponMapper.insertCoupon", bc);
	}

	public ArrayList<BoCoupon> usedCouponList(SqlSessionTemplate sqlSession, BoCoupon bc) {
		return (ArrayList)sqlSession.selectList("boCouponMapper.usedCouponList", bc);
	}

	public BoCoupon selectCoupon(SqlSessionTemplate sqlSession, String cno) {
		return sqlSession.selectOne("boCouponMapper.selectCoupon", cno);
	}

	public int updateCoupon(SqlSessionTemplate sqlSession, BoCoupon bc) {
		return sqlSession.update("boCouponMapper.updateCoupon", bc);
	}

}
