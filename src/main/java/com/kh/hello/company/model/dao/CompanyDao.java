package com.kh.hello.company.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Reservations;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyDao {

	ArrayList<Company2> selectAllCompany(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Room2> selectRoomList(SqlSessionTemplate sqlSession, Room2 roomList);

	Reservation2 insertReservation(SqlSessionTemplate sqlSession, Reservation2 reservation);

	int selectCurrval(SqlSessionTemplate sqlSession, Reservation2 reservation);

	Reservation2 selectOneReservation(SqlSessionTemplate sqlSession, Reservation2 reservation);

	ArrayList<Company2> selectOrderByName(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByMoney1(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByMoney2(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByMoney3(SqlSessionTemplate sqlSession, Company2 cp);

	List<Reservations> insertReservations(SqlSessionTemplate sqlSession, List<Reservations> list);

	ArrayList<Company2> selectOrderByGrade(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByTwoAvg(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByThreeAvg(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByFourAvg(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectOrderByFiveAvg(SqlSessionTemplate sqlSession, Company2 cp);

	ArrayList<Company2> selectCompanyTop3(SqlSessionTemplate sqlSession, Company2 cp2);








}
