package com.kh.kmanager.member.model.service;

import com.kh.kmanager.member.model.vo.Member;

public interface CWS_MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m) throws Exception;
	
	// 사업자 등록번호 중복체크
	int corpNoCheck(String corpNo);
	
	// 아이디 중복체크
	int idCheck(String checkId);
	
	// 아이디 찾기
	String findId(String corpNo);
	
	// 비밀번호 초기화폼 불러오기
	Member initializePwdForm(Member user);
	
	// 비밀번호 초기화
	int initializePwd(Member user);
	
	// 이메일 인증
	int updateMailKey(Member m);
	int updateMailAuth(Member m);
	int emailAuthFail(String sellerId);

}
