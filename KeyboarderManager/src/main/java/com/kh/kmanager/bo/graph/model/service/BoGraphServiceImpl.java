package com.kh.kmanager.bo.graph.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.graph.model.dao.BoGraphDao;
import com.kh.kmanager.bo.graph.model.vo.SalesGraph;
import com.kh.kmanager.po.product.model.vo.Product;

@Service
public class BoGraphServiceImpl implements BoGraphService {

	@Autowired
	private BoGraphDao graphDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 월별 매출통계 조회용 - 채영
	 * @param month : 조회하고 싶은 달
	 */
	@Override
	public ArrayList<SalesGraph> selectSalesGraph(int month) {
		return graphDao.selectSalesGraph(sqlSession, month);
	}

	/**
	 * 전체 월 평균 매출 통계 조회용 - 채영
	 */
	@Override
	public ArrayList<SalesGraph> selectAvgSalesGraph() {
		return graphDao.selectAvgSalesGraph(sqlSession);
	}

	@Override
	public ArrayList<SalesGraph>selectopProduct() {
		
		return graphDao.selectopProduct(sqlSession);
	}

	@Override
	public ArrayList<SalesGraph> showProductImages() {
		return graphDao.showProductImages(sqlSession);
	}

}
