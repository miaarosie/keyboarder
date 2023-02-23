package com.kh.kmanager.po.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.product.model.dao.ProductDao;
import com.kh.kmanager.po.product.model.vo.Product;

@Service
public class NSJ_ProductServiceImpl implements NSJ_ProductService{
	//Mybatis 사용하기위한 선언문
		@Autowired
		private SqlSessionTemplate sqlSession;
		//ProductDao 객체 선언
		@Autowired
		private ProductDao productDao;
		
	
	
	@Override
	public int insertProduct(Product p) {
		// TODO Auto-generated method stub
		return productDao.insertProduct(sqlSession, p);
	}

	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return productDao.updateProduct(sqlSession, p);
	}

	@Override
	public ArrayList<Product> showProduct(int sellerNo) {
		return productDao.showProduct(sqlSession, sellerNo);
	}

	@Override
	public Product detailProduct(int productNo) {
		// TODO Auto-generated method stub
		return productDao.detailProduct(sqlSession,productNo);
	}

	@Override
	public Product searchProduct(String ProductName) {
		// TODO Auto-generated method stub
		return null;
	}

	public interface FileUploadService {
		public String saveFile();
	}

	@Override
	public int deleteProduct(int productNo) {
		
		return productDao.deleteProduct(sqlSession,productNo);
	}

	@Override
	  public Product countProduct(int sellerNo) {
  
	  return productDao.countProduct(sqlSession,sellerNo); 
	  }
	

	@Override
	public ArrayList<Product>selectProduct (Product p) {
		
		return productDao.selectProduct(sqlSession,p);
	}

	@Override
	public int changeProduct(int productNo) {
		
		return productDao.changeProduct(sqlSession,productNo);
	}

	
	
	
}
