package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface SellerDao {
	
	//판매자 마이페이지 메인 예약 건수 조회
	int selectReservationCount(int mId, SqlSessionTemplate sqlSession);
	
	//판매자 마이페이지 메인 수익 조회
	int selectReservationPrice(int mId, SqlSessionTemplate sqlSession);
	
	//판매자 마이페이지 메인 업체 평점 통계
	ArrayList<CompanyGoodStat> selectGoodStats(int mId, SqlSessionTemplate sqlSession);
	
	//판매자 마이페이지 메인 수익 통계
	ArrayList<CompanySaleStat> selectSaleStats(int mId, SqlSessionTemplate sqlSession);
	
	//판매자 마이페이지 메인 디테일 수익 통계
	ArrayList<CompanySaleStat> selectDetailSaleStats(int mId, SqlSessionTemplate sqlSession);
	
	//판매자 마이페이지 메인 업체 승인 메시지
	ArrayList<CompanyOKResult> selectOKList(int mId, SqlSessionTemplate sqlSession);

	//판매자 마이페이지 메인 새 리뷰 메시지
	ArrayList<CompanyReviewResult> selectReviewList(int mId, SqlSessionTemplate sqlSession);

	//판매자 마이페이지 메인 새 QnA 메시지
	ArrayList<CompanyQnAResult> selectQnAList(int mId, SqlSessionTemplate sqlSession);
	
	//사업자등록번호 중복 조회
	int duplicationCRNo(String no, SqlSessionTemplate sqlSession);

	//법인등록번호 중복 조회
	int duplicationCPRNo(String no, SqlSessionTemplate sqlSession);
	
	//업체명 중복 조회
	int duplicationTitle(String title, SqlSessionTemplate sqlSession);

	//업체 등록
	int insertCompany(Company c, SqlSessionTemplate sqlSession);

	//객실1 등록
	int insertRoom1(Room rm, SqlSessionTemplate sqlSession);

	//객실2 등록
	int insertRoom2(Room rm, SqlSessionTemplate sqlSession);
	
	//객실3 등록
	int insertRoom3(Room rm, SqlSessionTemplate sqlSession);

	//객실4 등록
	int insertRoom4(Room rm, SqlSessionTemplate sqlSession);

	//객실5 등록
	int insertRoom5(Room rm, SqlSessionTemplate sqlSession);
		
	//객실6 등록
	int insertRoom6(Room rm, SqlSessionTemplate sqlSession);
		
	//객실7 등록
	int insertRoom7(Room rm, SqlSessionTemplate sqlSession);

	//객실8 등록
	int insertRoom8(Room rm, SqlSessionTemplate sqlSession);
		
	//객실9 등록
	int insertRoom9(Room rm, SqlSessionTemplate sqlSession);
	
	//등록이력 추가
	int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession);

	//사업자등록증 파일 추가
	int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession);

	//법인등록증 파일 추가
	int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession);

	//전체 상품 조회 리스트 카운트
	int getProductListCount(int mId, SqlSessionTemplate sqlSession);

	//전체 상품 조회 리스트
	ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession);

	//등록 기간 검색 상품 조회 리스트 카운트
	int getSearchDateProductListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession);

	//등록 기간 검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate,
			PageInfo pi, SqlSessionTemplate sqlSession);

	//검색 상품 조회 리스트 카운트
	int getSearchWordProductListCount(int mId, SearchProduct spd, SqlSessionTemplate sqlSession);

	//검색 상품 조회 리스트
	ArrayList<SearchProduct> selectSearchWordProductList(int mId, SearchProduct spd, PageInfo pi,
			SqlSessionTemplate sqlSession);

	//선택 상품 조회
	ArrayList<OneProduct> selectOneProduct(int cId, int crId, SqlSessionTemplate sqlSession);

	//업체 수정
	int updateProduct(ArrayList<Room> list, SqlSessionTemplate sqlSession);

	//등록 기간 연장
	int extendsPeriod(String cId, String term, SqlSessionTemplate sqlSession);

	//예약 내역 전체 조회 리스트 카운트
	int getReservationListCount(int mId, SqlSessionTemplate sqlSession);

	//예약 내역 전체 조회 리스트
	ArrayList<SellerReservation> selectReservationList(int mId, PageInfo pi, SqlSessionTemplate sqlSession);

	//예약 기간 검색 리스트 카운트
	int getSearchDateReservationListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession);

	//예약 기간 검색 리스트
	ArrayList<SellerReservation> selectSearchDateReservationList(int mId, String toDate, String fromDate, PageInfo pi,
			SqlSessionTemplate sqlSession);

	//예약 검색 내역 리스트 카운트
	int getSearchWordReservationListCount(int mId, SellerReservation sr, SqlSessionTemplate sqlSession);

	//예약 검색 내역 리스트
	ArrayList<SellerReservation> selectSearchWordReservationList(int mId, SellerReservation sr, PageInfo pi, SqlSessionTemplate sqlSession);

	//예약 상세 조회
	ArrayList<SellerOneReservation> selectOneReservation(int oId, SqlSessionTemplate sqlSession);

	//수익 전체 조회 리스트 카운트
	int getRevenueListCount(int mId, SqlSessionTemplate sqlSession);

	//수익 전체 조회 리스트
	ArrayList<Revenue> selectRevenueList(int mId, PageInfo pi, SqlSessionTemplate sqlSession);

	//수익 기간 검색 조회 리스트 카운트
	int getSearchDateRevenueListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession);

	//수익 기간 검색 조회 리스트
	ArrayList<Revenue> selectSearchDateRevenueList(int mId, String toDate, String fromDate, PageInfo pi,
			SqlSessionTemplate sqlSession);

	//수익 검색 조회 리스트 카운트
	int getSearchWordRevenueListCount(int mId, Revenue r, SqlSessionTemplate sqlSession);

	//수익 검색 조회 리스트
	ArrayList<Revenue> selectSearchWordRevenueList(int mId, Revenue r, PageInfo pi, SqlSessionTemplate sqlSession);

}
