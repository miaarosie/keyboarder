package com.kh.keyboarder.order.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.keyboarder.order.model.dao.PGDataDao;
import com.kh.keyboarder.order.model.vo.PGData;

import lombok.Data;

@Service
public class PGDataService {

	@Data
	private class Response{
		private PaymentInfo response;
	}
	
	@Data
	private class PaymentInfo{
		private int amount;
	}
	
	@Autowired
	private PGDataDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertOrder(PGData pgd) {
		return dao.insertOrder(sqlSession, pgd) 
				* dao.insertPayment(sqlSession, pgd)
				* dao.insertSettlement(sqlSession, pgd)
				* (pgd.getCouponNo().charAt(0) == 'K'? dao.insertKeyboarderCouponUse(sqlSession, pgd) : dao.insertStoreCouponUse(sqlSession, pgd));
	}
	
	public int insertOrderNoCoupon(PGData pgd) {
		return dao.insertOrder(sqlSession, pgd) 
				* dao.insertPayment(sqlSession, pgd)
				* dao.insertSettlement(sqlSession, pgd);
	}

	public int selectRefundAmount(PGData pgd) {
		return dao.selectRefundAmount(sqlSession, pgd);
	}
	
	public int orderCancel(PGData pgd) {
		return dao.refundOrder(sqlSession, pgd)
				* dao.refundPayment(sqlSession, pgd);
	}
	
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
		
//		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
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
	
	public int confirmPay(PGData pgd) {
		return dao.confirmPay(sqlSession, pgd)
					* dao.confirmSettle(sqlSession, pgd);
	}
}
