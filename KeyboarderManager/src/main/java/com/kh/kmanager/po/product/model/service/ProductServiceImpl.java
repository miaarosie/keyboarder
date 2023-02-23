package com.kh.kmanager.po.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.store.model.vo.Store;
import com.kh.kmanager.po.product.model.dao.ProductDao;
import com.kh.kmanager.po.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Product> getProductName(int sellerNo) {
		return productDao.getProductName(sqlSession, sellerNo);
	}

}
