package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.CompanyGoodStat;
import com.kh.hello.seller.model.vo.CompanyOKResult;
import com.kh.hello.seller.model.vo.CompanyQnAResult;
import com.kh.hello.seller.model.vo.CompanyReviewResult;
import com.kh.hello.seller.model.vo.CompanySaleStat;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Revenue;
import com.kh.hello.seller.model.vo.SellerReservation;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;
import com.kh.hello.seller.model.vo.SellerOneReservation;

public interface SellerService {

	//판매자 메인페이지 메인 예약 건수 조회
	int selectReservationCount(int mId);
	
	//판매자 메인페이지 메인 수익 조회
	int selectReservationPrice(int mId);
	
	//판매자 마이페이지 메인 업체 평점 통계
	ArrayList<CompanyGoodStat> selectGoodStats(int mId);
	
	//판매자 마이페이지 메인 수익 통계
	ArrayList<CompanySaleStat> selectSaleStats(int mId);
	
	//판매자 마이페이지 메인 디테일 수익 통계
	ArrayList<CompanySaleStat> selectDetailSaleStats(int mId);
	
	//판매자 마이페이지 메인 업체 승인 메시지
	ArrayList<CompanyOKResult> selectOKList(int mId);

	//판매자 마이페이지 메인 새 리뷰 알림 메시지
	ArrayList<CompanyReviewResult> selectReviewList(int mId);

	//판매자 마이페이지 메인 새 QnA 알림 메시지
	ArrayList<CompanyQnAResult> selectQnAList(int mId);
	
	//사업자등록번호 중복 조회
	int duplicationCRNo(String no);

	//법인등록번호 중복 조회
	int duplicationCPRNo(String no);
	
	//업체명 중복 조회
	int duplicationTitle(String title);
	
	//업체 등록
	int insertRegistration(Registration r, Attachment perFileDB, Attachment comFileDB);
	
	//전체 상품 조회 리스트 카운트
	int getProductListCount(int mId);

	//전체 상품 조회 리스트
	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi);

	//등록 기간 검색 상품 조회 리스트 카운트
	int getSearchDateProductListCount(int mId, String toDate, String fromDate);

	//등록 기간 검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi);

	//검색 상품 조회 리스트 카운트
	int getSearchWordProductListCount(int mId, SearchProduct spd);

	//검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchWordProductList(int mId, SearchProduct spd, PageInfo pi);

	//선택 상품 조회
	ArrayList<OneProduct> selectOneProduct(int cId, int crId);

	//업체 수정
	int updateProduct(ArrayList<Room> list);

	//등록 기간 연장
	int extendsPeriod(String cId, String term);

	//예약 내역 전체 조회 리스트 카운트
	int getReservationListCount(int mId);

	//예약 내역 전체 조회 리스트
	ArrayList<SellerReservation> selectReservationList(int mId, PageInfo pi);

	//예약 기간 검색 리스트 카운트
	int getSearchDateReservationListCount(int mId, String toDate, String fromDate);

	//예약 기간 검색 리스트
	ArrayList<SellerReservation> selectSearchDateReservationList(int mId, String toDate, String fromDate,
			PageInfo pi);

	//예약 검색 내역 리스트 카운트
	int getSearchWordReservationListCount(int mId, SellerReservation sr);

	//예약 검색 내역 리스트
	ArrayList<SellerReservation> selectSearchWordReservationList(int mId, SellerReservation sr, PageInfo pi);

	//예약 상세 조회
	ArrayList<SellerOneReservation> selectOneReservation(int oId);

	//수익 전체 조회 리스트 카운트
	int getRevenueListCount(int mId);

	//수익 전체 조회 리스트
	ArrayList<Revenue> selectRevenueList(int mId, PageInfo pi);

	//수익 기간 검색 조회 리스트 카운트
	int getSearchDateRevenueListCount(int mId, String toDate, String fromDate);

	//수익 기간 검색 조회 리스트
	ArrayList<Revenue> selectSearchDateRevenueList(int mId, String toDate, String fromDate, PageInfo pi);

	//수익 검색 조회 리스트 카운트
	int getSearchWordRevenueListCount(int mId, Revenue r);

	//수익 검색 조회 리스트
	ArrayList<Revenue> selectSearchWordRevenueList(int mId, Revenue r, PageInfo pi);

}
