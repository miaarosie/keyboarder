package com.kh.kmanager.bo.graph.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.graph.model.vo.SalesGraph;
import com.kh.kmanager.po.product.model.vo.Product;

@Repository
public class BoGraphDao {

	public ArrayList<SalesGraph> selectSalesGraph(SqlSessionTemplate sqlSession, int month) {
		return (ArrayList)sqlSession.selectList("graphMapper.selectSalesGraph", month);
	}

	public ArrayList<SalesGraph> selectAvgSalesGraph(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("graphMapper.selectAvgSalesGraph");
	}

	public ArrayList<SalesGraph> selectopProduct(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("graphMapper.selectopProduct");
	}

	public ArrayList<SalesGraph> showProductImages(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("graphMapper.productImg");
	}

	
}
