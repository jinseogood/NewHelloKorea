package com.kh.hello.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.dao.SellerDao;
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

@Service
public class SellerServiceImpl implements SellerService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SellerDao sd;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//판매자 마이페이지 메인 예약 건수 조회
	@Override
	public int selectReservationCount(int mId) {
		return sd.selectReservationCount(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 수익 조회
	@Override
	public int selectReservationPrice(int mId) {
		return sd.selectReservationPrice(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 업체 평점 통계
	@Override
	public ArrayList<CompanyGoodStat> selectGoodStats(int mId) {
		return sd.selectGoodStats(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 수익 통계
	@Override
	public ArrayList<CompanySaleStat> selectSaleStats(int mId) {
		return sd.selectSaleStats(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 디테일 수익 통계
	@Override
	public ArrayList<CompanySaleStat> selectDetailSaleStats(int mId) {
		return sd.selectDetailSaleStats(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 업체 승인 메시지
	@Override
	public ArrayList<CompanyOKResult> selectOKList(int mId) {
		return sd.selectOKList(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 새 리뷰 메시지
	@Override
	public ArrayList<CompanyReviewResult> selectReviewList(int mId) {
		return sd.selectReviewList(mId, sqlSession);
	}
	
	//판매자 마이페이지 메인 새 QnA 메시지
	@Override
	public ArrayList<CompanyQnAResult> selectQnAList(int mId) {
		return sd.selectQnAList(mId, sqlSession);
	}
	
	//사업자등록번호 중복 조회
	@Override
	public int duplicationCRNo(String no) {
		return sd.duplicationCRNo(no, sqlSession);
	}

	//법인등록번호 중복 조회
	@Override
	public int duplicationCPRNo(String no) {
		return sd.duplicationCPRNo(no, sqlSession);
	}
	
	//업체명 중복 조회
	@Override
	public int duplicationTitle(String title) {
		return sd.duplicationTitle(title, sqlSession);
	}

	//업체 등록
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, rollbackFor={Exception.class})
	public int insertRegistration(Registration r, Attachment perFileDB, Attachment comFileDB) {
		int result=-99;
		
		int resultC=0;
		int resultR1=0;
		int resultR2=0;
		int resultR3=0;
		int resultR4=0;
		int resultR5=0;
		int resultR6=0;
		int resultR7=0;
		int resultR8=0;
		int resultR9=0;
		int resultRH=0;
		int resultCF=0;
		int resultPF=0;
		
		System.out.println("Service Registration : " + r);
		
		//Company
		Company c=new Company();
		c.setcId(r.getcId());
		c.setContentId(r.getContentId());
		c.setSellerType(r.getSellerType());
		c.setCompanyNum(r.getCompanyNum());
		c.setPersonalNum(r.getPersonalNum());
		c.setCompanyName(r.getCompanyName());
		c.setCompanyPhone(r.getCompanyPhone());
		c.setCompanyAddress(r.getCompanyAddress());
		c.setmId(r.getmId());
		
		resultC=sd.insertCompany(c, sqlSession);
		
		if(resultC > 0){
			result=1;
		}
		
		System.out.println("C result : " + result);
		
		//Room
		if(r.getRoomType2() != null){
			if(r.getRoomType3() != null){
				if(r.getRoomType4() != null){
					if(r.getRoomType5() != null){
						if(r.getRoomType6() != null){
							if(r.getRoomType7() != null){
								if(r.getRoomType8() != null){
									if(r.getRoomType9() != null){
										System.out.println("Room 9");
										
										Room rm=new Room();
										rm.setrId(r.getcId());
										rm.setRoomType(r.getRoomType1());
										rm.setRoomCount(r.getRoomCount1());
										rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
										rm.setRoomPeople(r.getRoomPeople1());
										rm.setrId(r.getrId());
										
										resultR1=sd.insertRoom1(rm, sqlSession);
										
										Room rm2=new Room();
										rm2.setrId(r.getcId());
										rm2.setRoomType(r.getRoomType2());
										rm2.setRoomCount(r.getRoomCount2());
										rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
										rm2.setRoomPeople(r.getRoomPeople2());
										rm2.setrId(r.getrId());
										
										resultR2=sd.insertRoom2(rm2, sqlSession);
										
										Room rm3=new Room();
										rm3.setrId(r.getcId());
										rm3.setRoomType(r.getRoomType3());
										rm3.setRoomCount(r.getRoomCount3());
										rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
										rm3.setRoomPeople(r.getRoomPeople3());
										rm3.setrId(r.getrId());
										
										resultR3=sd.insertRoom3(rm3, sqlSession);
										
										Room rm4=new Room();
										rm4.setrId(r.getcId());
										rm4.setRoomType(r.getRoomType4());
										rm4.setRoomCount(r.getRoomCount4());
										rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
										rm4.setRoomPeople(r.getRoomPeople4());
										rm4.setrId(r.getrId());
										
										resultR4=sd.insertRoom4(rm4, sqlSession);
										
										Room rm5=new Room();
										rm5.setrId(r.getcId());
										rm5.setRoomType(r.getRoomType5());
										rm5.setRoomCount(r.getRoomCount5());
										rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
										rm5.setRoomPeople(r.getRoomPeople5());
										rm5.setrId(r.getrId());
										
										resultR5=sd.insertRoom5(rm5, sqlSession);
										
										Room rm6=new Room();
										rm6.setrId(r.getcId());
										rm6.setRoomType(r.getRoomType6());
										rm6.setRoomCount(r.getRoomCount6());
										rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
										rm6.setRoomPeople(r.getRoomPeople6());
										rm6.setrId(r.getrId());
										
										resultR6=sd.insertRoom6(rm6, sqlSession);
										
										Room rm7=new Room();
										rm7.setrId(r.getcId());
										rm7.setRoomType(r.getRoomType7());
										rm7.setRoomCount(r.getRoomCount7());
										rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
										rm7.setRoomPeople(r.getRoomPeople7());
										rm7.setrId(r.getrId());
										
										resultR7=sd.insertRoom7(rm7, sqlSession);
										
										Room rm8=new Room();
										rm8.setrId(r.getcId());
										rm8.setRoomType(r.getRoomType8());
										rm8.setRoomCount(r.getRoomCount8());
										rm8.setRoomPrice(Integer.parseInt(r.getRoomPrice8()));
										rm8.setRoomPeople(r.getRoomPeople8());
										rm8.setrId(r.getrId());
										
										resultR8=sd.insertRoom8(rm8, sqlSession);
										
										Room rm9=new Room();
										rm9.setrId(r.getcId());
										rm9.setRoomType(r.getRoomType9());
										rm9.setRoomCount(r.getRoomCount9());
										rm9.setRoomPrice(Integer.parseInt(r.getRoomPrice9()));
										rm9.setRoomPeople(r.getRoomPeople9());
										rm9.setrId(r.getrId());
										
										resultR9=sd.insertRoom9(rm9, sqlSession);
										
										System.out.println("resultR1 : " + resultR1);
										System.out.println("resultR2 : " + resultR2);
										System.out.println("resultR3 : " + resultR3);
										System.out.println("resultR4 : " + resultR4);
										System.out.println("resultR5 : " + resultR5);
										System.out.println("resultR6 : " + resultR6);
										System.out.println("resultR7 : " + resultR7);
										System.out.println("resultR8 : " + resultR8);
										System.out.println("resultR9 : " + resultR9);
										
										if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0 && resultR5 > 0 && resultR6 > 0 && resultR7 > 0 && resultR8 > 0 && resultR9 > 0){
											result=1;
										}
										else{
											result=0;
										}
										
										System.out.println("R9 result : " + result);
									}
									else{
										System.out.println("Room 8");
										
										Room rm=new Room();
										rm.setrId(r.getcId());
										rm.setRoomType(r.getRoomType1());
										rm.setRoomCount(r.getRoomCount1());
										rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
										rm.setRoomPeople(r.getRoomPeople1());
										rm.setrId(r.getrId());
										
										resultR1=sd.insertRoom1(rm, sqlSession);
										
										Room rm2=new Room();
										rm2.setrId(r.getcId());
										rm2.setRoomType(r.getRoomType2());
										rm2.setRoomCount(r.getRoomCount2());
										rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
										rm2.setRoomPeople(r.getRoomPeople2());
										rm2.setrId(r.getrId());
										
										resultR2=sd.insertRoom2(rm2, sqlSession);
										
										Room rm3=new Room();
										rm3.setrId(r.getcId());
										rm3.setRoomType(r.getRoomType3());
										rm3.setRoomCount(r.getRoomCount3());
										rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
										rm3.setRoomPeople(r.getRoomPeople3());
										rm3.setrId(r.getrId());
										
										resultR3=sd.insertRoom3(rm3, sqlSession);
										
										Room rm4=new Room();
										rm4.setrId(r.getcId());
										rm4.setRoomType(r.getRoomType4());
										rm4.setRoomCount(r.getRoomCount4());
										rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
										rm4.setRoomPeople(r.getRoomPeople4());
										rm4.setrId(r.getrId());
										
										resultR4=sd.insertRoom4(rm4, sqlSession);
										
										Room rm5=new Room();
										rm5.setrId(r.getcId());
										rm5.setRoomType(r.getRoomType5());
										rm5.setRoomCount(r.getRoomCount5());
										rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
										rm5.setRoomPeople(r.getRoomPeople5());
										rm5.setrId(r.getrId());
										
										resultR5=sd.insertRoom5(rm5, sqlSession);
										
										Room rm6=new Room();
										rm6.setrId(r.getcId());
										rm6.setRoomType(r.getRoomType6());
										rm6.setRoomCount(r.getRoomCount6());
										rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
										rm6.setRoomPeople(r.getRoomPeople6());
										rm6.setrId(r.getrId());
										
										resultR6=sd.insertRoom6(rm6, sqlSession);
										
										Room rm7=new Room();
										rm7.setrId(r.getcId());
										rm7.setRoomType(r.getRoomType7());
										rm7.setRoomCount(r.getRoomCount7());
										rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
										rm7.setRoomPeople(r.getRoomPeople7());
										rm7.setrId(r.getrId());
										
										resultR7=sd.insertRoom7(rm7, sqlSession);
										
										Room rm8=new Room();
										rm8.setrId(r.getcId());
										rm8.setRoomType(r.getRoomType8());
										rm8.setRoomCount(r.getRoomCount8());
										rm8.setRoomPrice(Integer.parseInt(r.getRoomPrice8()));
										rm8.setRoomPeople(r.getRoomPeople8());
										rm8.setrId(r.getrId());
										
										resultR8=sd.insertRoom8(rm8, sqlSession);
										
										System.out.println("resultR1 : " + resultR1);
										System.out.println("resultR2 : " + resultR2);
										System.out.println("resultR3 : " + resultR3);
										System.out.println("resultR4 : " + resultR4);
										System.out.println("resultR5 : " + resultR5);
										System.out.println("resultR6 : " + resultR6);
										System.out.println("resultR7 : " + resultR7);
										System.out.println("resultR8 : " + resultR8);
										
										if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0 && resultR5 > 0 && resultR6 > 0 && resultR7 > 0 && resultR8 > 0){
											result=1;
										}
										else{
											result=0;
										}
										
										System.out.println("R8 result : " + result);
										
									}
								}
								else{
									System.out.println("Room 7");
									
									Room rm=new Room();
									rm.setrId(r.getcId());
									rm.setRoomType(r.getRoomType1());
									rm.setRoomCount(r.getRoomCount1());
									rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
									rm.setRoomPeople(r.getRoomPeople1());
									rm.setrId(r.getrId());
									
									resultR1=sd.insertRoom1(rm, sqlSession);
									
									Room rm2=new Room();
									rm2.setrId(r.getcId());
									rm2.setRoomType(r.getRoomType2());
									rm2.setRoomCount(r.getRoomCount2());
									rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
									rm2.setRoomPeople(r.getRoomPeople2());
									rm2.setrId(r.getrId());
									
									resultR2=sd.insertRoom2(rm2, sqlSession);
									
									Room rm3=new Room();
									rm3.setrId(r.getcId());
									rm3.setRoomType(r.getRoomType3());
									rm3.setRoomCount(r.getRoomCount3());
									rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
									rm3.setRoomPeople(r.getRoomPeople3());
									rm3.setrId(r.getrId());
									
									resultR3=sd.insertRoom3(rm3, sqlSession);
									
									Room rm4=new Room();
									rm4.setrId(r.getcId());
									rm4.setRoomType(r.getRoomType4());
									rm4.setRoomCount(r.getRoomCount4());
									rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
									rm4.setRoomPeople(r.getRoomPeople4());
									rm4.setrId(r.getrId());
									
									resultR4=sd.insertRoom4(rm4, sqlSession);
									
									Room rm5=new Room();
									rm5.setrId(r.getcId());
									rm5.setRoomType(r.getRoomType5());
									rm5.setRoomCount(r.getRoomCount5());
									rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
									rm5.setRoomPeople(r.getRoomPeople5());
									rm5.setrId(r.getrId());
									
									resultR5=sd.insertRoom5(rm5, sqlSession);
									
									Room rm6=new Room();
									rm6.setrId(r.getcId());
									rm6.setRoomType(r.getRoomType6());
									rm6.setRoomCount(r.getRoomCount6());
									rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
									rm6.setRoomPeople(r.getRoomPeople6());
									rm6.setrId(r.getrId());
									
									resultR6=sd.insertRoom6(rm6, sqlSession);
									
									Room rm7=new Room();
									rm7.setrId(r.getcId());
									rm7.setRoomType(r.getRoomType7());
									rm7.setRoomCount(r.getRoomCount7());
									rm7.setRoomPrice(Integer.parseInt(r.getRoomPrice7()));
									rm7.setRoomPeople(r.getRoomPeople7());
									rm7.setrId(r.getrId());
									
									resultR7=sd.insertRoom7(rm7, sqlSession);
									
									System.out.println("resultR1 : " + resultR1);
									System.out.println("resultR2 : " + resultR2);
									System.out.println("resultR3 : " + resultR3);
									System.out.println("resultR4 : " + resultR4);
									System.out.println("resultR5 : " + resultR5);
									System.out.println("resultR6 : " + resultR6);
									System.out.println("resultR7 : " + resultR7);
									
									if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0 && resultR5 > 0 && resultR6 > 0 && resultR7 > 0){
										result=1;
									}
									else{
										result=0;
									}
									
									System.out.println("R7 result : " + result);
									
								}
							}
							else{
								System.out.println("Room 6");
								
								Room rm=new Room();
								rm.setrId(r.getcId());
								rm.setRoomType(r.getRoomType1());
								rm.setRoomCount(r.getRoomCount1());
								rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
								rm.setRoomPeople(r.getRoomPeople1());
								rm.setrId(r.getrId());
								
								resultR1=sd.insertRoom1(rm, sqlSession);
								
								Room rm2=new Room();
								rm2.setrId(r.getcId());
								rm2.setRoomType(r.getRoomType2());
								rm2.setRoomCount(r.getRoomCount2());
								rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
								rm2.setRoomPeople(r.getRoomPeople2());
								rm2.setrId(r.getrId());
								
								resultR2=sd.insertRoom2(rm2, sqlSession);
								
								Room rm3=new Room();
								rm3.setrId(r.getcId());
								rm3.setRoomType(r.getRoomType3());
								rm3.setRoomCount(r.getRoomCount3());
								rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
								rm3.setRoomPeople(r.getRoomPeople3());
								rm3.setrId(r.getrId());
								
								resultR3=sd.insertRoom3(rm3, sqlSession);
								
								Room rm4=new Room();
								rm4.setrId(r.getcId());
								rm4.setRoomType(r.getRoomType4());
								rm4.setRoomCount(r.getRoomCount4());
								rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
								rm4.setRoomPeople(r.getRoomPeople4());
								rm4.setrId(r.getrId());
								
								resultR4=sd.insertRoom4(rm4, sqlSession);
								
								Room rm5=new Room();
								rm5.setrId(r.getcId());
								rm5.setRoomType(r.getRoomType5());
								rm5.setRoomCount(r.getRoomCount5());
								rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
								rm5.setRoomPeople(r.getRoomPeople5());
								rm5.setrId(r.getrId());
								
								resultR5=sd.insertRoom5(rm5, sqlSession);
								
								Room rm6=new Room();
								rm6.setrId(r.getcId());
								rm6.setRoomType(r.getRoomType6());
								rm6.setRoomCount(r.getRoomCount6());
								rm6.setRoomPrice(Integer.parseInt(r.getRoomPrice6()));
								rm6.setRoomPeople(r.getRoomPeople6());
								rm6.setrId(r.getrId());
								
								resultR6=sd.insertRoom6(rm6, sqlSession);
								
								System.out.println("resultR1 : " + resultR1);
								System.out.println("resultR2 : " + resultR2);
								System.out.println("resultR3 : " + resultR3);
								System.out.println("resultR4 : " + resultR4);
								System.out.println("resultR5 : " + resultR5);
								System.out.println("resultR6 : " + resultR6);
								
								if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0 && resultR5 > 0 && resultR6 > 0){
									result=1;
								}
								else{
									result=0;
								}
								
								System.out.println("R6 result : " + result);
								
							}
						}
						else{
							System.out.println("Room 5");
							
							Room rm=new Room();
							rm.setrId(r.getcId());
							rm.setRoomType(r.getRoomType1());
							rm.setRoomCount(r.getRoomCount1());
							rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
							rm.setRoomPeople(r.getRoomPeople1());
							rm.setrId(r.getrId());
							
							resultR1=sd.insertRoom1(rm, sqlSession);
							
							Room rm2=new Room();
							rm2.setrId(r.getcId());
							rm2.setRoomType(r.getRoomType2());
							rm2.setRoomCount(r.getRoomCount2());
							rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
							rm2.setRoomPeople(r.getRoomPeople2());
							rm2.setrId(r.getrId());
							
							resultR2=sd.insertRoom2(rm2, sqlSession);
							
							Room rm3=new Room();
							rm3.setrId(r.getcId());
							rm3.setRoomType(r.getRoomType3());
							rm3.setRoomCount(r.getRoomCount3());
							rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
							rm3.setRoomPeople(r.getRoomPeople3());
							rm3.setrId(r.getrId());
							
							resultR3=sd.insertRoom3(rm3, sqlSession);
							
							Room rm4=new Room();
							rm4.setrId(r.getcId());
							rm4.setRoomType(r.getRoomType4());
							rm4.setRoomCount(r.getRoomCount4());
							rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
							rm4.setRoomPeople(r.getRoomPeople4());
							rm4.setrId(r.getrId());
							
							resultR4=sd.insertRoom4(rm4, sqlSession);
							
							Room rm5=new Room();
							rm5.setrId(r.getcId());
							rm5.setRoomType(r.getRoomType5());
							rm5.setRoomCount(r.getRoomCount5());
							rm5.setRoomPrice(Integer.parseInt(r.getRoomPrice5()));
							rm5.setRoomPeople(r.getRoomPeople5());
							rm5.setrId(r.getrId());
							
							resultR5=sd.insertRoom5(rm5, sqlSession);
							
							System.out.println("resultR1 : " + resultR1);
							System.out.println("resultR2 : " + resultR2);
							System.out.println("resultR3 : " + resultR3);
							System.out.println("resultR4 : " + resultR4);
							System.out.println("resultR5 : " + resultR5);
							
							if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0 && resultR5 > 0){
								result=1;
							}
							else{
								result=0;
							}
							
							System.out.println("R5 result : " + result);
							
						}
					}
					else{
						System.out.println("Room 4");
						
						Room rm=new Room();
						rm.setrId(r.getcId());
						rm.setRoomType(r.getRoomType1());
						rm.setRoomCount(r.getRoomCount1());
						rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
						rm.setRoomPeople(r.getRoomPeople1());
						rm.setrId(r.getrId());
						
						resultR1=sd.insertRoom1(rm, sqlSession);
						
						Room rm2=new Room();
						rm2.setrId(r.getcId());
						rm2.setRoomType(r.getRoomType2());
						rm2.setRoomCount(r.getRoomCount2());
						rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
						rm2.setRoomPeople(r.getRoomPeople2());
						rm2.setrId(r.getrId());
						
						resultR2=sd.insertRoom2(rm2, sqlSession);
						
						Room rm3=new Room();
						rm3.setrId(r.getcId());
						rm3.setRoomType(r.getRoomType3());
						rm3.setRoomCount(r.getRoomCount3());
						rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
						rm3.setRoomPeople(r.getRoomPeople3());
						rm3.setrId(r.getrId());
						
						resultR3=sd.insertRoom3(rm3, sqlSession);
						
						Room rm4=new Room();
						rm4.setrId(r.getcId());
						rm4.setRoomType(r.getRoomType4());
						rm4.setRoomCount(r.getRoomCount4());
						rm4.setRoomPrice(Integer.parseInt(r.getRoomPrice4()));
						rm4.setRoomPeople(r.getRoomPeople4());
						rm4.setrId(r.getrId());
						
						resultR4=sd.insertRoom4(rm4, sqlSession);
						
						System.out.println("resultR1 : " + resultR1);
						System.out.println("resultR2 : " + resultR2);
						System.out.println("resultR3 : " + resultR3);
						System.out.println("resultR4 : " + resultR4);
						
						if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0 && resultR4 > 0){
							result=1;
						}
						else{
							result=0;
						}
						
						System.out.println("R4 result : " + result);
						
					}
				}
				else{
					System.out.println("Room 3");
					
					Room rm=new Room();
					rm.setrId(r.getcId());
					rm.setRoomType(r.getRoomType1());
					rm.setRoomCount(r.getRoomCount1());
					rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
					rm.setRoomPeople(r.getRoomPeople1());
					rm.setrId(r.getrId());
					
					resultR1=sd.insertRoom1(rm, sqlSession);
					
					Room rm2=new Room();
					rm2.setrId(r.getcId());
					rm2.setRoomType(r.getRoomType2());
					rm2.setRoomCount(r.getRoomCount2());
					rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
					rm2.setRoomPeople(r.getRoomPeople2());
					rm2.setrId(r.getrId());
					
					resultR2=sd.insertRoom2(rm2, sqlSession);
					
					Room rm3=new Room();
					rm3.setrId(r.getcId());
					rm3.setRoomType(r.getRoomType3());
					rm3.setRoomCount(r.getRoomCount3());
					rm3.setRoomPrice(Integer.parseInt(r.getRoomPrice3()));
					rm3.setRoomPeople(r.getRoomPeople3());
					rm3.setrId(r.getrId());
					
					resultR3=sd.insertRoom3(rm3, sqlSession);
					
					System.out.println("resultR1 : " + resultR1);
					System.out.println("resultR2 : " + resultR2);
					System.out.println("resultR3 : " + resultR3);
					
					if(result == 1 && resultR1 > 0 && resultR2 > 0 && resultR3 > 0){
						result=1;
					}
					else{
						result=0;
					}
					
					System.out.println("R3 result : " + result);
					
				}
			}
			else{
				System.out.println("Room 2");
				
				Room rm=new Room();
				rm.setrId(r.getcId());
				rm.setRoomType(r.getRoomType1());
				rm.setRoomCount(r.getRoomCount1());
				rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
				rm.setRoomPeople(r.getRoomPeople1());
				rm.setrId(r.getrId());
				
				resultR1=sd.insertRoom1(rm, sqlSession);
				
				Room rm2=new Room();
				rm2.setrId(r.getcId());
				rm2.setRoomType(r.getRoomType2());
				rm2.setRoomCount(r.getRoomCount2());
				rm2.setRoomPrice(Integer.parseInt(r.getRoomPrice2()));
				rm2.setRoomPeople(r.getRoomPeople2());
				rm2.setrId(r.getrId());
				
				resultR2=sd.insertRoom2(rm2, sqlSession);
				
				System.out.println("resultR1 : " + resultR1);
				System.out.println("resultR2 : " + resultR2);
				
				if(result == 1 && resultR1 > 0 && resultR2 > 0){
					result=1;
				}
				else{
					result=0;
				}
				
				System.out.println("R2 result : " + result);
				
			}
		}
		else{
			System.out.println("Room 1");
			
			Room rm=new Room();
			rm.setrId(r.getcId());
			rm.setRoomType(r.getRoomType1());
			rm.setRoomCount(r.getRoomCount1());
			rm.setRoomPrice(Integer.parseInt(r.getRoomPrice1()));
			rm.setRoomPeople(r.getRoomPeople1());
			rm.setrId(r.getrId());
			
			resultR1=sd.insertRoom1(rm, sqlSession);
			
			System.out.println("resultR1 : " + resultR1);
			
			if(result == 1 && resultR1 > 0){
				result=1;
			}
			else{
				result=0;
			}
			
			System.out.println("R1 result : " + result);
			
		}
		
		//RH
		RegistrationHistory rh=new RegistrationHistory();
		rh.setcId(r.getcId());
		rh.setTerm(r.getTerm());
		
		resultRH=sd.insertRH(rh, sqlSession);
		
		if(result == 1 && resultRH > 0){
			result=1;
		}
		else{
			result=0;
		}
		
		System.out.println("RH result : " + result);
		
		if(comFileDB != null){
			resultPF=sd.insertPerFile(perFileDB, sqlSession);
			resultCF=sd.insertComFile(comFileDB, sqlSession);
			
			if(result == 1 && resultPF > 0 && resultCF > 0){
				result=1;
			}
			else{
				result=0;
			}
			
			System.out.println("PF&CF result : " + result);
			
		}
		else{
			resultPF=sd.insertPerFile(perFileDB, sqlSession);
			
			if(result == 1 && resultPF > 0){
				result=1;
			}
			else{
				result=0;
			}
			
			System.out.println("PF result : " + result);
			
		}
		
		System.out.println("Final result : " + result);
		
		return result;
	}
	
	//전체 상품 조회 리스트 카운트
	@Override
	public int getProductListCount(int mId) {
		return sd.getProductListCount(mId, sqlSession);
	}

	//전체 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi) {
		return sd.selectProductList(mId, pi, sqlSession);
	}

	//등록 기간 검색 상품 조회 리스트 카운트
	@Override
	public int getSearchDateProductListCount(int mId, String toDate, String fromDate) {
		return sd.getSearchDateProductListCount(mId, toDate, fromDate, sqlSession);
	}

	//등록 기간 검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi) {
		return sd.selectSearchDateProductList(mId, toDate, fromDate, pi, sqlSession);
	}

	//검색 상품 조회 리스트 카운트
	@Override
	public int getSearchWordProductListCount(int mId, SearchProduct spd) {
		return sd.getSearchWordProductListCount(mId, spd, sqlSession);
	}

	//검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchWordProductList(int mId, SearchProduct spd, PageInfo pi) {
		return sd.selectSearchWordProductList(mId, spd, pi, sqlSession);
	}

	//선택 상품 조회
	@Override
	public ArrayList<OneProduct> selectOneProduct(int cId, int crId) {
		return sd.selectOneProduct(cId, crId, sqlSession);
	}

	//업체 수정
	@Override
	public int updateProduct(ArrayList<Room> list) {
		return sd.updateProduct(list, sqlSession);
	}

	//등록 기간 연장
	@Override
	public int extendsPeriod(String cId, String term) {
		return sd.extendsPeriod(cId, term, sqlSession);
	}

	//예약 내역 전체 조회 리스트 카운트
	@Override
	public int getReservationListCount(int mId) {
		return sd.getReservationListCount(mId, sqlSession);
	}

	//예약 내역 전체 조회 리스트
	@Override
	public ArrayList<SellerReservation> selectReservationList(int mId, PageInfo pi) {
		return sd.selectReservationList(mId, pi, sqlSession);
	}

	//예약 기간 검색 리스트 카운트
	@Override
	public int getSearchDateReservationListCount(int mId, String toDate, String fromDate) {
		return sd.getSearchDateReservationListCount(mId, toDate, fromDate, sqlSession);
	}

	//예약 기간 검색 리스트
	@Override
	public ArrayList<SellerReservation> selectSearchDateReservationList(int mId, String toDate, String fromDate,
			PageInfo pi) {
		return sd.selectSearchDateReservationList(mId, toDate, fromDate, pi, sqlSession);
	}

	//예약 검색 내역 리스트 카운트
	@Override
	public int getSearchWordReservationListCount(int mId, SellerReservation sr) {
		return sd.getSearchWordReservationListCount(mId, sr, sqlSession);
	}

	//예약 검색 내역 리스트
	@Override
	public ArrayList<SellerReservation> selectSearchWordReservationList(int mId, SellerReservation sr,
			PageInfo pi) {
		return sd.selectSearchWordReservationList(mId, sr, pi, sqlSession);
	}

	//예약 상세 조회
	@Override
	public ArrayList<SellerOneReservation> selectOneReservation(int oId) {
		return sd.selectOneReservation(oId, sqlSession);
	}

	//수익 전체 조회 리스트 카운트
	@Override
	public int getRevenueListCount(int mId) {
		return sd.getRevenueListCount(mId, sqlSession);
	}

	//수익 전체 조회 리스트
	@Override
	public ArrayList<Revenue> selectRevenueList(int mId, PageInfo pi) {
		return sd.selectRevenueList(mId, pi, sqlSession);
	}

	//수익 기간 검색 조회 리스트 카운트
	@Override
	public int getSearchDateRevenueListCount(int mId, String toDate, String fromDate) {
		return sd.getSearchDateRevenueListCount(mId, toDate, fromDate, sqlSession);
	}

	//수익 기간 검색 조회 리스트
	@Override
	public ArrayList<Revenue> selectSearchDateRevenueList(int mId, String toDate, String fromDate, PageInfo pi) {
		return sd.selectSearchDateRevenueList(mId, toDate, fromDate, pi, sqlSession);
	}

	//수익 검색 조회 리스트 카운트
	@Override
	public int getSearchWordRevenueListCount(int mId, Revenue r) {
		return sd.getSearchWordRevenueListCount(mId, r, sqlSession);
	}

	//수익 검색 조회 리스트
	@Override
	public ArrayList<Revenue> selectSearchWordRevenueList(int mId, Revenue r, PageInfo pi) {
		return sd.selectSearchWordRevenueList(mId, r, pi, sqlSession);
	}

}
