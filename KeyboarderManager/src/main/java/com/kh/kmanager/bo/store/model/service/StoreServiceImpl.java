package com.kh.kmanager.bo.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.store.model.dao.StoreDao;
import com.kh.kmanager.bo.store.model.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 입점업체 목록 조회용 - 채영
	 */
	@Override
	public ArrayList<Store> selectStoreList() {
		return storeDao.selectStoreList(sqlSession);
	}

	/**
	 * 입점업체 상세 조회용 - 채영
	 * @param : 입점업체 식별키
	 */
	@Override
	public Store selectStore(Store s) {
		return storeDao.selectStore(sqlSession, s);
	}

	/**
	 * 입점업체 정보 수정용 - 채영
	 * @param : 입점업체 식별키
	 */
	@Override
	public int updateStore(Store s) {
		return storeDao.updateStore(sqlSession, s);
	}

	/**
	 * 입점업체 삭제용 - 채영
	 * @param : 입점업체 식별키
	 */
	@Override
	public int deleteStore(Store s) {
		return storeDao.deleteStore(sqlSession, s);
	}

	/**
	 * 입점업체 승인용 - 채영
	 * @param : 입점업체 식별키
	 */
	@Override
	public int identifyStore(Store s) {
		return storeDao.identifyStore(sqlSession, s);
	}

	/**
	 * 입점업체 계좌 변경용 - 채영
	 * @param : 입점업체 식별키
	 */
	@Override
	public int updateStoreAccount(Store s) {
		return storeDao.updateStoreAccount(sqlSession, s);
	}
}
