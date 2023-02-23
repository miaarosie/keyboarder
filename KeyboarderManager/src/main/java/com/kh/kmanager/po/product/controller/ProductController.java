package com.kh.kmanager.po.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.store.model.vo.Store;
import com.kh.kmanager.po.product.model.service.ProductService;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

	/**
	 * BO 쿠폰 등록시 상품명을 가져오는 메소드 - 채영
	 * @return : 각 스토어별 상품 목록
	 */
	@ResponseBody
	@RequestMapping(value="getProductName.bo", produces="application/json; charset=UTF-8")
	public String getProductName(int sellerNo) {
		
		ArrayList<Product> plist = productService.getProductName(sellerNo);
		
		return new Gson().toJson(plist);
	}
}
	
