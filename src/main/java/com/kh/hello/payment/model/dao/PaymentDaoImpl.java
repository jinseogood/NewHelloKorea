package com.kh.hello.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;
import com.kh.hello.seller.model.vo.SellerReservation;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	//결제 정보 등록
	@Override
	public int insertPayment(Payment p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Payment.insertPayment", p);
	}

	//결제 상세 정보 등록
	@Override
	public int insertPayDetail(ArrayList<PayDetail> pdList, SqlSessionTemplate sqlSession) {
		int result=0;
		for(int i=0;i<pdList.size();i++){
			PayDetail pd=pdList.get(i);
			result=sqlSession.insert("PayDetail.insertPayDetail", pd);
		}
		return result;
	}

	//결제 완료 페이지에 보여 줄 결제 정보 조회
	@Override
	public Payment selectPayInfo(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Payment.selectPayInfo", mId);
	}

	//결제 완료 페이지에 보여 줄 결제 상세 정보 조회
	@Override
	public ArrayList<PayDetail> selectPayDetailInfo(int paId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("PayDetail.selectPayDetailInfo", paId);
	}

	//예약 정보에 결제 번호 추가
	@Override
	public int updateReservation(int oId, SqlSessionTemplate sqlSession) {
		return sqlSession.update("SellerReservation.updateReservation", oId);
	}

	//결제 확인 창에 보여 줄 예약 정보 조회
	@Override
	public Reservation2 selectReservation(int paId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("SellerReservation.selectReservation", paId);
	}

	//회원 포인트 조회
	@Override
	public int selectUserPoint(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Payment.selectUserPoint", mId);
	}

	//포인트 이력 추가
	@Override
	public int insertPoint(int mId, int point, SqlSessionTemplate sqlSession) {
		System.out.println("mId : " + mId + ", point : " + point);
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(point);
		return sqlSession.insert("PayDetail.insertPoint", list);
	}

}
