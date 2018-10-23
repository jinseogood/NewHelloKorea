package com.kh.hello.good.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.hello.good.model.dao.GoodDao;
import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

@Service
public class GoodServiceImpl implements GoodService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private GoodDao gd;
	@Autowired
	private DataSourceTransactionManager transactionManager;

//	이미 찜한 목록인지 확인하는 메소드
	@Override
	public int selectOneDibs(Good gg) {
		return gd.selectOneDibs(sqlSession, gg);
	}

//	찜 추가
	@Override
	public int insertDibsHotel(Good gg) {
		return gd.insertOneDibs(sqlSession, gg);
	}

//	찜 삭제
	@Override
	public int deleteDibsHotel(Good gg) {
		return gd.deleteOneDibs(sqlSession, gg);
	}

	@Override
	public int dibsCheckStatus(Good2 gg2) {
		return gd.dibsCheckStatus(sqlSession,gg2);
	}

	@Override
	public int insertDibsInfo(Good2 gg2) {
		return gd.insertDibsInfo(sqlSession, gg2);
	}

	@Override
	public int deleteDibsInfo(Good2 gg2) {
		return gd.deleteDibsInfo(sqlSession, gg2);
	}

	@Override
	public ArrayList<Good2> dibsGradeInfo() {
		return gd.dibsGradeInfo(sqlSession);
	}


	
	
	
	
	
	
	
	

}
