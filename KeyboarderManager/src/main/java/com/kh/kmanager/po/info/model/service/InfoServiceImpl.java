package com.kh.kmanager.po.info.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.info.model.dao.InfoDao;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InfoDao infoDao;

	@Override
	public int emailCheck(String checkEmail) {
		return infoDao.emailCheck(sqlSession, checkEmail);
	}

	@Override
	public int updateInfo(Member updatePo) {
		return infoDao.updateInfo(sqlSession, updatePo);
	}

	@Override
	public Member refreshInfo(String sellerName) {
		return infoDao.refreshInfo(sqlSession, sellerName);
	}

	@Override
	public int secession(String sellerName) {
		return infoDao.secession(sqlSession, sellerName);
	}
}
