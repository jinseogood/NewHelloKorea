package com.kh.hello.company.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Reservations;
import com.kh.hello.company.model.vo.Room2;

public interface CompanyService {

	ArrayList<Company2> selectAllCompany(Company2 cp);

	ArrayList<Room2> selectRoomList(Room2 roomList);

	Reservation2 insertReservation(Reservation2 reservation);

	ArrayList<Company2> selectOrderByName(Company2 cp);

	ArrayList<Company2> selectOrderByMoney1(Company2 cp);

	ArrayList<Company2> selectOrderByMoney2(Company2 cp);

	ArrayList<Company2> selectOrderByMoney3(Company2 cp);

	List<Reservations> insertReservations(List<Reservations> list);

	ArrayList<Company2> selectOrderByGrade(Company2 cp);

	ArrayList<Company2> selectOrderByTwoAvg(Company2 cp);

	ArrayList<Company2> selectOrderByThreeAvg(Company2 cp);

	ArrayList<Company2> selectOrderByFourAvg(Company2 cp);

	ArrayList<Company2> selectOrderByFiveAvg(Company2 cp);

	ArrayList<Company2> selectCompanyTop3(Company2 cp2);







}
