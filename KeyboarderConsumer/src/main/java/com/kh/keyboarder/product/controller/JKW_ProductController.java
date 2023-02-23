package com.kh.keyboarder.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.common.template.Pagination;
import com.kh.keyboarder.product.model.service.JKW_ProductService;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

@Controller
public class JKW_ProductController {
	
	@Autowired
	private JKW_ProductService JKW_ProductService;

	/**
	 * FO 상품 전체 조회
	 * * 주멋돌
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("foProductNotice.pro")
	public String foProductNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = JKW_ProductService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> proList = JKW_ProductService.selectList(pi);

		model.addAttribute("pi", pi);
		model.addAttribute("proList", proList);
				
		return "product/foProductNotice";
	}
}




































