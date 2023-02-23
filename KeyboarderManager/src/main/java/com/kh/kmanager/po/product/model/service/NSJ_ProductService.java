package com.kh.kmanager.po.product.model.service;


import java.util.ArrayList;

import com.kh.kmanager.po.product.model.vo.Product;

public interface NSJ_ProductService {


	//상품등록(insert)
	int insertProduct(Product p);
	
	//상품삭제(update)
	int deleteProduct(int productNo);
	
	//상품 수정(update)
	int updateProduct(Product p);
	
	//상품 전체 조회(select)
	
	ArrayList<Product> showProduct(int sellerNo);
	
	//상품 상세 조회 (select)
	
	Product detailProduct(int productNo);
	
	//상품 검색(select)
	Product searchProduct(String ProductName);

	//판매상품숫자 세기(select)
	Product countProduct(int sellerNo);

	//상품 이름 검색(select)
	ArrayList<Product> selectProduct(Product p);

	//상품을 재공개 해주는 메소드
	int changeProduct(int productNo);
	
	

	

	

	
	
}
