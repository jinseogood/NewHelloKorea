package com.kh.hello.payment.model.service;

import java.util.ArrayList;

import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;
import com.kh.hello.seller.model.vo.SellerReservation;

public interface PaymentService {

	//결제 정보 등록
	int insertAllPayment(Payment p, ArrayList<PayDetail> pdList);

	//결제 완료 페이지에 보여 줄 결제 정보 조회
	Payment selectPayInfo(int mId);
	
	//결제 완료 페이지에 보여 줄 결제 상세 정보 조회
	ArrayList<PayDetail> selectPayDetailInfo(int paId);

	//예약 정보에 결제 번호 추가
	int updateReservation(int oId);

	//결제 확인 창에 보여줄 예약 정보 조회
	Reservation2 selectReservation(int paId);

	//회원 포인트 조회
	int selectUserPoint(int mId);

	//포인트 이력 추가
	int insertPoint(int mId, int point);

}
