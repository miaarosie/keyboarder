package com.kh.kmanager.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.common.model.dao.PoMainPageDao;
import com.kh.kmanager.common.model.vo.PoMainData;

@Service
public class PoMainPageServiceImpl implements PoMainPageService {

	@Autowired
	private PoMainPageDao mainDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public PoMainData mainOrderSummary(int sellerNo) {
		return mainDao.mainOrderSummary(sqlSession, sellerNo);
	}

	@Override
	public PoMainData mainPaymentSummary(int sellerNo) {
		return mainDao.mainPaymentSummary(sqlSession, sellerNo);
	}

	@Override
	public ArrayList<PoMainData> mainBarGraph(int sellerNo) {
		return mainDao.mainBarGraph(sqlSession, sellerNo);
	}

	@Override
	public PoMainData mainProductSummary(int sellerNo) {
		return mainDao.mainProductSummary(sqlSession, sellerNo);
	}

}
