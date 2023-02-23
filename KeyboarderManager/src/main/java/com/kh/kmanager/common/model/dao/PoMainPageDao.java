package com.kh.kmanager.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.model.vo.PoMainData;

@Repository
public class PoMainPageDao {

	public PoMainData mainOrderSummary(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("mainPageMapper.mainOrderSummary", sellerNo);
	}

	public PoMainData mainPaymentSummary(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("mainPageMapper.mainPaymentSummary", sellerNo);
	}

	public ArrayList<PoMainData> mainBarGraph(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("mainPageMapper.mainBarGraph", sellerNo);
	}

	public PoMainData mainProductSummary(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("mainPageMapper.mainProductSummary", sellerNo);
	}

}
