package com.kh.hello.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;
import com.kh.hello.seller.model.vo.SellerReservation;

public interface PaymentDao {

	//결제 정보 등록
	int insertPayment(Payment p, SqlSessionTemplate sqlSession);

	//결제 상세 정보 등록
	int insertPayDetail(ArrayList<PayDetail> pdList, SqlSessionTemplate sqlSession);

	//결제 완료 페이지에 보여 줄 결제 정보 조회
	Payment selectPayInfo(int mId, SqlSessionTemplate sqlSession);

	//결제 완료 페이지에 보여 줄 결제 상세 정보 조회
	ArrayList<PayDetail> selectPayDetailInfo(int paId, SqlSessionTemplate sqlSession);

	//예약 정보에 결제 번호 추가
	int updateReservation(int oId, SqlSessionTemplate sqlSession);

	//결제 확인창에 보여 줄 예약 정보 조회
	Reservation2 selectReservation(int paId, SqlSessionTemplate sqlSession);

	//회원 포인트 조회
	int selectUserPoint(int mId, SqlSessionTemplate sqlSession);

	//포인트 이력 추가
	int insertPoint(int mId, int point, SqlSessionTemplate sqlSession);

}
