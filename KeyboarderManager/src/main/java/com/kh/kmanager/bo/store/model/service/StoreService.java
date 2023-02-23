package com.kh.kmanager.bo.store.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.kmanager.bo.store.model.dao.StoreDao;
import com.kh.kmanager.bo.store.model.vo.Store;

public interface StoreService {

	public ArrayList<Store> selectStoreList();
	
	public Store selectStore(Store s);
	
	public int updateStore(Store s);
	
	public int deleteStore(Store s);
	
	public int identifyStore(Store s);
	
	public int updateStoreAccount(Store s);
}
