package com.kh.kmanager.bo.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.store.model.vo.Store;

@Repository
public class StoreDao {

	public ArrayList<Store> selectStoreList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreList");
	}
	
	public Store selectStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.selectOne("storeMapper.selectStore", s);
	}

	public int updateStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.updateStore", s);
	}

	public int deleteStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.deleteStore", s);
	}
	
	public int identifyStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.identifyStore", s);
	}

	public int updateStoreAccount(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.updateStoreAccount", s);
	}
	
	
}
