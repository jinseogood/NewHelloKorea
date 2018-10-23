package com.kh.hello.good.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

public interface GoodDao {

	int selectOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int insertOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int deleteOneDibs(SqlSessionTemplate sqlSession, Good gg);

	int dibsCheckStatus(SqlSessionTemplate sqlSession, Good2 gg2);

	int insertDibsInfo(SqlSessionTemplate sqlSession, Good2 gg2);

	int deleteDibsInfo(SqlSessionTemplate sqlSession, Good2 gg2);

	ArrayList<Good2> dibsGradeInfo(SqlSessionTemplate sqlSession);


}
