package com.kh.kmanager.po.order.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.kmanager.po.order.model.dao.PoOrderDao;
import com.kh.kmanager.po.order.model.vo.PoOrder;

import lombok.Data;


@Service
public class PoOrderSerivceImpl implements PoOrderService{

	@Autowired
	public PoOrderDao orderDao;
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Data
	private class Response{
		private PaymentInfo response;
	}
	
	@Data
	private class PaymentInfo{
		private int amount;
	}
	
	/**
	 * 구매확정조회-장미
	 */
	@Override
	public ArrayList<PoOrder> selectDecisionOrder(PoOrder poOrder) {
		return orderDao.selectDecisionOrder(sqlSession, poOrder);
	}

	/**
	 * 구매확정내역 기간별 조회 - 장미
	 */
	@Override
	public ArrayList<PoOrder> searchPoOrderDecision(PoOrder poOrder) {
		return orderDao. searchPoOrderDecision(sqlSession, poOrder);
	}
	
	@Override
	public int selectListCount(HashMap<String, String> optionDefault) {
		return orderDao.selectListCount(sqlSession, optionDefault);
	}

	@Override
	public ArrayList<PoOrder> selectAllOrderList(HashMap<String, String> optionDefault) {
		return orderDao.selectAllOrderList(sqlSession, optionDefault);
	}

	// 구매확정내역 해당월 엑셀다운로드 - 장미
	@Override
	public ArrayList<PoOrder> orderDecisionList(PoOrder poOrder) {
		return orderDao.orderDecisionList(sqlSession, poOrder);
	}

	
	// 구매확정내역 기간별조회 엑셀다운로드 - 장미
	@Override
	public ArrayList<PoOrder> searchExcelDecisionList(PoOrder poOrder) {
		return orderDao.searchExcelDecisionList(sqlSession, poOrder);
	}

	/**
	 * 환불 관련 pg token 메소드 - 채영
	 */
	@Override
	public String getToken() throws IOException {
		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", "6070211026375121");
		json.addProperty("imp_secret", "RGio78HNbFT6AUT9wtoZPbKLI94jWzYLh0CLgVKUdISEfct6wC4oEqvzBVPU02KK0aUo4IfRlZu7Snoi");
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	public int paymentInfo(String paymentNo, String token) throws IOException {
		
		HttpsURLConnection conn = null;
	    
	    URL url = new URL("https://api.iamport.kr/payments/" + paymentNo);
	 
	    conn = (HttpsURLConnection) url.openConnection();
	 
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", token);
	    conn.setDoOutput(true);
	 
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    Gson gson = new Gson();
	    
	    Response response = gson.fromJson(br.readLine(), Response.class);
	    
	    br.close();
	    conn.disconnect();
	    
	    return response.getResponse().getAmount();
	}
	
	public int orderCancel(PoOrder pgd) {
		return orderDao.refundOrder(sqlSession, pgd)
				* orderDao.refundPayment(sqlSession, pgd);
	}

	public void payMentCancel(String access_token, String imp_uid, int amount, String reason) throws IOException  {
//		System.out.println("결제 취소");
//		
//		System.out.println(access_token);
//		
//		System.out.println(imp_uid);
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		json.addProperty("amount", amount);
		json.addProperty("checksum", amount);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
 
		br.close();
		conn.disconnect();
	}

	@Override
	public ArrayList<PoOrder> selectOrderList(HashMap<String, String> option) {
		return orderDao.selectOrderList(sqlSession, option);
	}
}
