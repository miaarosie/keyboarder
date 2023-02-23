package com.kh.kmanager.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 선처리용 preHandle 메소드 오버라이딩
	@Override
	public boolean preHandle(HttpServletRequest request,
						HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		// loginUser 키값 있는지 검사
		if (session.getAttribute("loginUser") != null) { // 로그인된 상태라면
			// Controller 가 실행되도록 처리
			return true;
			
		} else { // 로그인 전 상태라면
			// Controller 실행 막기
			
			// alertMsg 로 "로그인 후 이용 가능한 서비스입니다." 알람메시지 담기
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			// 응답 뷰 지정 (메인페이지로 url 재요청)
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
	}
}
