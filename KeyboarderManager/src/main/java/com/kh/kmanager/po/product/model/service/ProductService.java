package com.kh.kmanager.po.product.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.store.model.vo.Store;
import com.kh.kmanager.po.product.model.vo.Product;

public interface ProductService {

	ArrayList<Product> getProductName(int sellerNo);
}
