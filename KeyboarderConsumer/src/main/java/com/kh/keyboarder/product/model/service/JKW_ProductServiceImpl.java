package com.kh.keyboarder.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.product.model.dao.JKW_ProductDao;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

@Service
public class JKW_ProductServiceImpl implements JKW_ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JKW_ProductDao JKW_ProductDao;
	
	/**
	 * FO 상품 전체 조회 페이징 처리를 위한 상품 개수 확인
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@Override
	public int selectListCount() {
		
		return JKW_ProductDao.selectListCount(sqlSession);
	}

	/**
	 * FO 상품 전체 조회
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		
		return JKW_ProductDao.selectList(sqlSession, pi);
	}

}
