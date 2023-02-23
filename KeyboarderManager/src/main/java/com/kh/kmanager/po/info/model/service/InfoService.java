package com.kh.kmanager.po.info.model.service;

import com.kh.kmanager.member.model.vo.Member;

public interface InfoService {

	// 이메일 중복체크
	int emailCheck(String checkEmail);
	
	// 정보 수정
	int updateInfo(Member updatePo);
	
	// 정보 수정 후 세션 새로고침
	Member refreshInfo(String sellerName);
	
	// 탈퇴하기
	int secession(String sellerName);
}
