package com.kh.kmanager.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.member.model.vo.Member;

@Repository
public class CWS_MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		if (m.getSellerId().equals("admin")) {
			return sqlSession.selectOne("member-mapper.loginAdmin", m);
		} else {
			return sqlSession.selectOne("member-mapper.loginMember", m);			
		}

	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("member-mapper.idCheck", checkId);
	}
	
	public int corpNoCheck(SqlSessionTemplate sqlSession, String corpNo) {
		return sqlSession.selectOne("member-mapper.corpNoCheck", corpNo);
	}
	
	public String findId(SqlSessionTemplate sqlSession, String corpNo) {
		return sqlSession.selectOne("member-mapper.findId", corpNo);
	}
	
	public Member initializePwdForm(SqlSessionTemplate sqlSession, Member user) {
		return sqlSession.selectOne("member-mapper.initializePwdForm", user);
	}
	
	public int initializePwd(SqlSessionTemplate sqlSession, Member user) {
		return sqlSession.update("member-mapper.initializePwd", user);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("member-mapper.insertMember", m);
	}
	
	public int updateMailKey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member-mapper.updateMailKey", m);
	}
	public  int updateMailAuth(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("member-mapper.updateMailAuth", m);
	}
	public  int emailAuthFail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("member-mapper.emailAuthFail", id);
	}
	
}
