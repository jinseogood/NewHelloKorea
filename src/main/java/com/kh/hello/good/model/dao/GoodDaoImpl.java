package com.kh.hello.good.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

@Repository
public class GoodDaoImpl implements GoodDao {

//	찜한 목록인지 조회
	@Override
	public int selectOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.selectOne("Good.selectOneDibs", gg);
	}

//	찜 목록 추가
	@Override
	public int insertOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.insert("Good.insertOneDibsHotel", gg);
	}

//	찜 목록 삭제
	@Override
	public int deleteOneDibs(SqlSessionTemplate sqlSession, Good gg) {
		return sqlSession.delete("Good.deleteOneDibsHotel", gg);
	}

	@Override
	public int dibsCheckStatus(SqlSessionTemplate sqlSession, Good2 gg2) {
		return sqlSession.selectOne("Good2.selectOnedibsCheckStatus", gg2);
	}

	@Override
	public int insertDibsInfo(SqlSessionTemplate sqlSession, Good2 gg2) {
		return sqlSession.insert("Good2.insertDibsInfo", gg2);
	}

	@Override
	public int deleteDibsInfo(SqlSessionTemplate sqlSession, Good2 gg2) {
		return sqlSession.delete("Good2.deleteDibsInfo", gg2);
	}

	@Override
	public ArrayList<Good2> dibsGradeInfo(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Good2.dibsGradeInfo");
	}

	
	
	
	

}
