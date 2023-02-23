package com.kh.kmanager.common.model.service;

import java.util.ArrayList;

import com.kh.kmanager.common.model.vo.PoMainData;

public interface PoMainPageService {

	PoMainData mainOrderSummary(int sellerNo);
	
	PoMainData mainPaymentSummary(int sellerNo);
	
	ArrayList<PoMainData> mainBarGraph(int sellerNo);
	
	PoMainData mainProductSummary(int sellerNo);
}
