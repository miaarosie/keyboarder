package com.kh.keyboarder.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

@Repository
public class JKW_ProductDao {

	/**
	 * FO 상품 전체 조회 페이징 처리를 위한 상품 개수 확인
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productMapper.selectListCount");
	}
	
	/**
	 * FO 상품 전체 조회
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}

}
