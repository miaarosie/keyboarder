package com.kh.kmanager.po.info.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.member.model.vo.Member;

@Repository
public class InfoDao {

	// 이메일 중복체크
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("poInfoMapper.emailCheck", checkEmail);
	}
	
	// 정보 수정
	public int updateInfo(SqlSessionTemplate sqlSession, Member updatePo) {
		return sqlSession.update("poInfoMapper.updateInfo", updatePo);
	}
	
	// 정보 수정 후 로그인 유저 세션 새로고침
	public Member refreshInfo(SqlSessionTemplate sqlSession, String sellerName) {
		return sqlSession.selectOne("poInfoMapper.refreshInfo", sellerName);
	}
	
	// 탈퇴하기
	public int secession(SqlSessionTemplate sqlSession, String sellerName) {
		return sqlSession.update("poInfoMapper.secession", sellerName);
	}
}
