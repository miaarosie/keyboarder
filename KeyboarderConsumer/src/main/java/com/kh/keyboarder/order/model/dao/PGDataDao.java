package com.kh.keyboarder.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.order.model.vo.PGData;

@Repository
public class PGDataDao {


	public int insertOrder(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertOrder", pgd);
	}

	public int insertPayment(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertPayment", pgd);
	}

	public int insertSettlement(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertSettlement", pgd);
	}

	public int selectRefundAmount(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.selectOne("pgdMapper.selectRefundAmount", pgd);
	}

	public int refundOrder(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.refundOrder", pgd);
	}

	public int refundPayment(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.refundPayment", pgd);
	}

	public int insertKeyboarderCouponUse(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertKeyboarderCouponUse", pgd);
	}

	public int insertStoreCouponUse(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertStoreCouponUse", pgd);
	}

	public int confirmPay(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.confirmPay", pgd);
	}

	public int confirmSettle(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.confirmSettle", pgd);
	}

}
