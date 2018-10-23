package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class SellerDaoImpl implements SellerDao{

	//판매자 마이페이지 메인 예약 건수 조회
	@Override
	public int selectReservationCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("SellerReservation.selectReservationCount", mId);
	}
	
	//판매자 마이페이지 메인 수익 조회
	@Override
	public int selectReservationPrice(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("SellerReservation.selectReservationPrice", mId);
	}
	
	//판매자 마이페이지 메인 업체 평점 통계
	@Override
	public ArrayList<CompanyGoodStat> selectGoodStats(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectGoodStats", mId);
	}
	
	//판매자 마이페이지 메인 수익 통계
	@Override
	public ArrayList<CompanySaleStat> selectSaleStats(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectSaleStats", mId);
	}
	
	//판매자 마이페이지 메인 디테일 수익 통계
	@Override
	public ArrayList<CompanySaleStat> selectDetailSaleStats(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectDetailSaleStats", mId);
	}
	
	//판매자 마이페이지 메인 업체 승인 메시지
	@Override
	public ArrayList<CompanyOKResult> selectOKList(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectOKList", mId);
	}

	//판매자 마이페이지 메인 새 리뷰 메시지
	@Override
	public ArrayList<CompanyReviewResult> selectReviewList(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectReviewList", mId);
	}

	//판매자 마이페이지 메인 새 QnA 메시지
	@Override
	public ArrayList<CompanyQnAResult> selectQnAList(int mId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("Company.selectQnAList", mId);
	}
	
	//사업자등록번호 중복 조회
	@Override
	public int duplicationCRNo(String no, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Company.duplicationCRNo", no);
	}

	//법인등록번호 중복 조회
	@Override
	public int duplicationCPRNo(String no, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Company.duplicationCPRNo", no);
	}
	
	//업체명 중복 조회
	@Override
	public int duplicationTitle(String title, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Company.duplicationTitle", title);
	}
	
	//업체 등록
	@Override
	public int insertCompany(Company c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Company.insertCompany", c);
	}

	//객실1 등록
	@Override
	public int insertRoom1(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	//객실2 등록
	@Override
	public int insertRoom2(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	//객실3 등록
	@Override
	public int insertRoom3(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	//객실4 등록
	@Override
	public int insertRoom4(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
		
	//객실5 등록
	@Override
	public int insertRoom5(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
		
	//객실6 등록
	@Override
	public int insertRoom6(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
		
	//객실7 등록
	@Override
	public int insertRoom7(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
		
	//객실8 등록
	@Override
	public int insertRoom8(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
		
	//객실9 등록
	@Override
	public int insertRoom9(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}

	//등록이력 추가
	@Override
	public int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("RH.insertRH", rh);
	}

	//사업자등록증 파일 추가
	@Override
	public int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertPerFile", perFileDB);
	}

	//법인등록증 파일 추가
	@Override
	public int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertComFile", comFileDB);
	}

	//전체 상품 조회 리스트 카운트
	@Override
	public int getProductListCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Product.getProductListCount", mId);
	}

	//전체 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("Product.selectProductList", mId, rowBounds);
	}

	//등록 기간 검색 상품 조회 리스트 카운트
	@Override
	public int getSearchDateProductListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return sqlSession.selectOne("Product.getSearchDateProductListCount", list);
	}

	//등록 기간 검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return (ArrayList)sqlSession.selectList("Product.selectSearchDateProductList", list, rowBounds);
	}

	//검색 상품 조회 리스트 카운트
	@Override
	public int getSearchWordProductListCount(int mId, SearchProduct spd, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(spd);
		return sqlSession.selectOne("Product.getSearchWordProductListCount", list);
	}
	
	//검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchWordProductList(int mId, SearchProduct spd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(spd);
		return (ArrayList)sqlSession.selectList("Product.selectSearchWordProductList", list, rowBounds);
	}

	//선택 상품 조회
	@Override
	public ArrayList<OneProduct> selectOneProduct(int cId, int crId, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(cId);
		list.add(crId);
		return (ArrayList)sqlSession.selectList("OneProduct.selectOneProduct", list);
	}

	//업체 수정
	@Override
	public int updateProduct(ArrayList<Room> list, SqlSessionTemplate sqlSession) {
		int result=0;
		for(int i=0;i<list.size();i++){
			result=sqlSession.update("Room.updateProduct", list.get(i));
		}
		return result;
	}

	//등록 기간 연장
	@Override
	public int extendsPeriod(String cId, String term, SqlSessionTemplate sqlSession) {
		int cID=Integer.parseInt(cId);
		int period=Integer.parseInt(term);
		
		ArrayList<Object> epList=new ArrayList<Object>();
		epList.add(cID);
		epList.add(period);
		
		return sqlSession.insert("RH.extendsPeriod", epList);
	}

	//예약 내역 전체 조회 리스트 카운트
	@Override
	public int getReservationListCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("SellerReservation.getReservationListCount", mId);
	}

	//예약 내역 전체 조회 리스트
	@Override
	public ArrayList<SellerReservation> selectReservationList(int mId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList) sqlSession.selectList("SellerReservation.selectReservationList", mId, rowBounds);
	}

	//예약 기간 검색 리스트 카운트
	@Override
	public int getSearchDateReservationListCount(int mId, String toDate, String fromDate,
			SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return sqlSession.selectOne("SellerReservation.getSearchDateReservationListCount", list);
	}

	//예약 기간 검색 리스트
	@Override
	public ArrayList<SellerReservation> selectSearchDateReservationList(int mId, String toDate, String fromDate,
			PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return (ArrayList) sqlSession.selectList("SellerReservation.selectSearchDateReservationList", list, rowBounds);
	}

	//예약 검색 내역 리스트 카운트
	@Override
	public int getSearchWordReservationListCount(int mId, SellerReservation sr, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(sr);
		return sqlSession.selectOne("SellerReservation.getSearchWordReservationListCount", list);
	}

	//예약 검색 내역 리스트
	@Override
	public ArrayList<SellerReservation> selectSearchWordReservationList(int mId, SellerReservation sr, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(sr);
		return (ArrayList) sqlSession.selectList("SellerReservation.selectSearchWordReservationList", list, rowBounds);
	}

	//예약 상세 조회
	@Override
	public ArrayList<SellerOneReservation> selectOneReservation(int oId, SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("SellerOneReservation.selectOneReservation", oId);
	}

	//수익 전체 조회 리스트 카운트
	@Override
	public int getRevenueListCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Revenue.getRevenueListCount", mId);
	}

	//수익 전체 조회 리스트
	@Override
	public ArrayList<Revenue> selectRevenueList(int mId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Revenue> resultList=(ArrayList) sqlSession.selectList("Revenue.selectRevenueList", mId, rowBounds);
		
		//System.out.println(resultList);
		
		for(int i=0;i<resultList.size();i++){
			int cId=resultList.get(i).getcId();
			String date=resultList.get(i).getrDate();
			
			ArrayList<Object> list=new ArrayList<Object>();
			list.add(cId);
			list.add(date);
			
			int sResult=sqlSession.selectOne("Revenue.selectRSList", list);
			
			//System.out.println(i + " : " + sResult);
			
			if(sResult > 0){
				resultList.get(i).setStatus("A");
			}
			else{
				resultList.get(i).setStatus("B");
			}
		}
		
		return resultList;
	}

	//수익 기간 검색 조회 리스트 카운트
	@Override
	public int getSearchDateRevenueListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return sqlSession.selectOne("Revenue.getSearchDateRevenueListCount", list);
	}

	//수익 기간 검색 조회 리스트
	@Override
	public ArrayList<Revenue> selectSearchDateRevenueList(int mId, String toDate, String fromDate, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		
		ArrayList<Revenue> resultList=(ArrayList) sqlSession.selectList("Revenue.selectSearchDateRevenueList", list, rowBounds);
		
		for(int i=0;i<resultList.size();i++){
			int cId=resultList.get(i).getcId();
			
			int sResult=sqlSession.selectOne("Revenue.selectRSList", cId);
			
			if(sResult > 0){
				resultList.get(i).setStatus("A");
			}
			else{
				resultList.get(i).setStatus("B");
			}
		}
		
		return resultList;
	}

	//수익 검색 조회 리스트 카운트
	@Override
	public int getSearchWordRevenueListCount(int mId, Revenue r, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(r);
		return sqlSession.selectOne("Revenue.getSearchWordRevenueListCount", list);
	}

	//수익 검색 조회 리스트
	@Override
	public ArrayList<Revenue> selectSearchWordRevenueList(int mId, Revenue r, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(r);
		
		System.out.println("r status : " + r.getStatus());
		
		ArrayList<Revenue> resultList=(ArrayList) sqlSession.selectList("Revenue.selectSearchWordRevenueList", list, rowBounds);
		
		for(int i=0;i<resultList.size();i++){
			int cId=resultList.get(i).getcId();
			
			int sResult=sqlSession.selectOne("Revenue.selectRSList", cId);
			
			if(sResult > 0){
				resultList.get(i).setStatus("A");
			}
			else{
				resultList.get(i).setStatus("B");
			}
		}
		
		return resultList;
	}

}
