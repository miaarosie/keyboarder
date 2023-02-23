package com.kh.kmanager.po.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;

@Repository
public class CouponDao {

	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("poCouponMapper.insertCoupon",c);
	}

	
	public ArrayList<Product> prodcutListforCoupon(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("poMapper.getProductName",sellerNo);
	}


	public ArrayList<Coupon> showAbleCouponList(SqlSessionTemplate sqlSession, Coupon c ) {
		
		return (ArrayList)sqlSession.selectList("poCouponMapper.showAbleCouponList",c);
	}


	public ArrayList<Coupon> ableCouponSearch(SqlSessionTemplate sqlSession, Coupon c) {
		
		return (ArrayList)sqlSession.selectList("poCouponMapper.ableCouponSearch",c);
	}


	

	public ArrayList<Coupon> searchExCouponList(SqlSessionTemplate sqlSession, Coupon c) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("poCouponMapper.searchExCouponList",c);
	}

	
	public ArrayList<Coupon> poCouponUsedList(SqlSessionTemplate sqlSession, Coupon c){
		return (ArrayList)sqlSession.selectList("poCouponMapper.poCouponUsedList",c);
		
	}
		
	public ArrayList<Coupon> searchPoCouponUsed(SqlSessionTemplate sqlSession, Coupon c){
		return (ArrayList)sqlSession.selectList("poCouponMapper.searchPoCouponUsed",c);
	}


	public ArrayList<Coupon> showCouponListPo(SqlSessionTemplate sqlSession, Coupon c) {
		return(ArrayList)sqlSession.selectList("poCouponMapper.showCouponListPo",c);
	}


	public ArrayList<Coupon> CouponDetailSearch(SqlSessionTemplate sqlSession, Coupon c) {
		return(ArrayList)sqlSession.selectList("poCouponMapper.CouponDetailSearch",c);
	}


	public int updateCouponPo(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.update("poCouponMapper.updateCouponPo",c);
	}


	public Coupon detailCoupon(SqlSessionTemplate sqlSession, String couponNo) {
		 return sqlSession.selectOne("poCouponMapper.detailCoupon",couponNo);
	}

}
