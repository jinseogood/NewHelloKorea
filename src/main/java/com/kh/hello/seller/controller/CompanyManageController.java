package com.kh.hello.seller.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.CommonUtils;
import com.kh.hello.common.Pagination;
import com.kh.hello.common.PageInfo;
import com.kh.hello.member.model.vo.Member;
import com.kh.hello.seller.model.service.SellerService;
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
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;
import com.kh.hello.seller.model.vo.SellerOneReservation;
import com.kh.hello.seller.model.vo.SellerReservation;

import net.sf.json.JSONObject;

@Controller
public class CompanyManageController {
	@Autowired
	private SellerService ss;
	
	//판매자 마이페이지 메인 정보 조회
	@RequestMapping("myPageView.sell")
	public String myPageView(Model model, HttpServletRequest request){
		Member m=(Member) request.getSession().getAttribute("loginUser");
		
		//예약 건수 조회
		int reservationCount=ss.selectReservationCount(m.getmId());
		
		//수익 조회
		int totalPrice=ss.selectReservationPrice(m.getmId());
		
		if(reservationCount >= 0 && totalPrice >= 0){
			model.addAttribute("rCount", reservationCount);
			model.addAttribute("tPrice", totalPrice);
				
			return "seller/sellerMain";
		}
		else{
			model.addAttribute("msg", "건수 아니면 수익 조회 에러");
			
			return "common/errorPage";
		}
		
	}
	
	//판매자 마이페이지 메인 업체 평점 통계
	@RequestMapping(value="selectGoodStats.sell")
	public @ResponseBody HashMap<String, Object> selectGoodStats(HttpServletRequest request, HttpServletResponse response){
		Member m=(Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<CompanyGoodStat> list=ss.selectGoodStats(m.getmId());
		
		HashMap<String, Object> hmap=new HashMap<String, Object>();
		
		hmap.put("goodList", list);
		
		return hmap;
	}
	
	//판매자 마이페이지 메인 수익 통계
	@RequestMapping(value="selectSaleStats.sell")
	public @ResponseBody HashMap<String, Object> selectSaleStats(HttpServletRequest request, HttpServletResponse response){
		Member m=(Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<CompanySaleStat> list=ss.selectSaleStats(m.getmId());
			
		HashMap<String, Object> hmap=new HashMap<String, Object>();
			
		hmap.put("saleList", list);
			
		return hmap;
	}
	
	//판매자 마이페이지 메인 수익 통계
		@RequestMapping(value="selectDetailSaleStats.sell")
		public @ResponseBody HashMap<String, Object> selectDetailSaleStats(HttpServletRequest request, HttpServletResponse response){
			Member m=(Member) request.getSession().getAttribute("loginUser");
			
			ArrayList<CompanySaleStat> list=ss.selectDetailSaleStats(m.getmId());
				
			HashMap<String, Object> hmap=new HashMap<String, Object>();
				
			hmap.put("saleDetailList", list);
				
			return hmap;
		}
	
	//판매자 마이페이지 메인 안내 메시지 조회
	@RequestMapping(value="selectNotice.sell")
	public @ResponseBody HashMap<String, Object> selectNotice(HttpServletRequest request){
		Member m=(Member) request.getSession().getAttribute("loginUser");
			
		ArrayList<CompanyOKResult> okList=ss.selectOKList(m.getmId());
		ArrayList<CompanyReviewResult> reviewList=ss.selectReviewList(m.getmId());
		ArrayList<CompanyQnAResult> qnaList=ss.selectQnAList(m.getmId());
		
		HashMap<String, Object> hmap=new HashMap<String, Object>();
		
		if(okList != null){
			hmap.put("okList", okList);
		}
		if(reviewList != null){
			hmap.put("rList", reviewList);
		}
		if(qnaList != null){
			hmap.put("qList", qnaList);
		}
		
		return hmap;
			
	}
	
	//등록번호 중복확인
	@RequestMapping(value="duplicationCPRNo.sell")
	public void duplicationCPRNo(String no, HttpServletResponse response){
		System.out.println(no);
		
		int noLength=no.length();
		System.out.println(noLength);
		
		int checkResult=0;
		
		//사업자등록번호 중복 검사
		if(noLength == 10){
			checkResult=ss.duplicationCRNo(no);
			System.out.println("crnum set checkResult : " + checkResult);
		}
		//법인등록번호 중복 검사
		else{
			checkResult=ss.duplicationCPRNo(no);
			System.out.println("cprnum set checkResult : " + checkResult);
		}
		
		System.out.println(checkResult);
		
		try {
			PrintWriter out=response.getWriter();
			out.print(checkResult);
			
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//업체 등록
	@RequestMapping(value="addCompany.sell", method=RequestMethod.POST)
	public String addCompany(Registration r, Model model, HttpServletRequest request, @RequestParam(name="companyFile", required=false)MultipartFile companyFile, @RequestParam(name="personalFile")MultipartFile personalFile){
		
		System.out.println("Controller Registration : " + r);
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root + "\\uploadFiles\\seller";
		
		//사업자등록증 파일
		String originPerFileName=personalFile.getOriginalFilename();
		String perExt=originPerFileName.substring(originPerFileName.lastIndexOf("."));
		String changePerName=CommonUtils.getRandomString();
		
		//법인사업자등록증 파일
		String originComFileName="";
		String comExt="";
		String changeComName="";
		
		if(!r.getCompanyNum().equals("")){
			originComFileName=companyFile.getOriginalFilename();
			comExt=originComFileName.substring(originComFileName.lastIndexOf("."));
			changeComName=CommonUtils.getRandomString();
		}
		try {
			
			Attachment perFileDB=new Attachment();
			perFileDB.setFilePath(filePath);
			perFileDB.setOriginName(originPerFileName);
			perFileDB.setChangeName(changePerName + perExt);
			
			Attachment comFileDB=null;
			if(!originComFileName.equals("")){
				
				comFileDB=new Attachment();
				comFileDB.setFilePath(filePath);
				comFileDB.setOriginName(originComFileName);
				comFileDB.setChangeName(changeComName + comExt);
				
			}
			
			int result=ss.insertRegistration(r, perFileDB, comFileDB);
			
			if(result > 0){
				personalFile.transferTo(new File(filePath + "\\" + changePerName + perExt));
				if(!originComFileName.equals("")){
					companyFile.transferTo(new File(filePath + "\\" + changeComName + comExt));
				}
			}
			
			return "seller/sellerMain";
		}
		catch (Exception e) {
			new File(filePath + "\\" + changePerName + perExt).delete();
			if(!originComFileName.equals("")){
				new File(filePath + "\\" + changeComName + comExt).delete();
			}
			
			model.addAttribute("msg", "업체등록 오류");
			
			return "common/errorPage";
		}
		
	}
	
	//상품 관리
	@RequestMapping(value="manageProduct.sell")
	public String manageProduct(Model model, HttpServletRequest request, PageInfo p, String searchParam, String searchWord, String fromDate, String toDate){
		Member m=(Member)request.getSession().getAttribute("loginUser");
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		ArrayList<SearchProduct> list=null;
		PageInfo pi=null;
		int listCount=0;

		if(searchParam == null && searchWord == null){
			listCount=ss.getProductListCount(m.getmId());
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectProductList(m.getmId(), pi);
		}
		else if(searchParam.equals("datePick")){
			listCount=ss.getSearchDateProductListCount(m.getmId(), toDate, fromDate);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchDateProductList(m.getmId(), toDate, fromDate, pi);
		}
		else{
			SearchProduct spd=new SearchProduct();
			
			if(searchParam.equals("comName")){
				spd.setCompanyName(searchWord);
			}
			else if(searchParam.equals("comAddr")){
				spd.setCompanyAddress(searchWord);
			}
			else{
				if(searchWord.equals("승인완료")){
					searchWord="Y";
				}
				else if(searchWord.equals("미승인")){
					searchWord="N";
				}
				else if(searchWord.equals("중도해지")){
					searchWord="T";
				}
				spd.setStatus(searchWord);
			}
			
			listCount=ss.getSearchWordProductListCount(m.getmId(), spd);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchWordProductList(m.getmId(), spd, pi);
		}
		
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStatus().equals("Y")){
				list.get(i).setStatus("승인완료");
			}
			else if(list.get(i).getStatus().equals("N")){
				list.get(i).setStatus("미승인");
			}
			else if(list.get(i).getStatus().equals("T")){
				list.get(i).setStatus("중도해지");
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "seller/manageProduct";
	}
	
	//선택 상품 조회
	@RequestMapping(value="detailCompany.sell")
	public String detailCompany(int cId, int crId, Model model){
		ArrayList<OneProduct> opList=ss.selectOneProduct(cId, crId);
		
		model.addAttribute("opList", opList);
		
		return "seller/detailCompany";
	}
	
	//상품 수정 화면 이동
	@RequestMapping(value="editCompanyView.sell")
	public String editCompanyView(OneProduct op, Model model){
		ArrayList<OneProduct> eOP=ss.selectOneProduct(op.getcId(), op.getCrId());
		
		model.addAttribute("eOP", eOP);
		
		return "seller/editCompany";
	}
	
	//상품 수정
	@RequestMapping(value="editCompany.sell")
	public String editCompany(@RequestParam int cId, @RequestParam int crId
			, @RequestParam String roomType1, @RequestParam int roomCount1, @RequestParam String roomPrice1, @RequestParam int roomId1
			, @RequestParam(name="roomType2", required=false) String roomType2, @RequestParam(name="roomCount2", required=false, defaultValue="0") int roomCount2, @RequestParam(name="roomPrice2", required=false) String roomPrice2, @RequestParam(name="roomId2", required=false, defaultValue="0") int roomId2
			, @RequestParam(name="roomType3", required=false) String roomType3, @RequestParam(name="roomCount3", required=false, defaultValue="0") int roomCount3, @RequestParam(name="roomPrice3", required=false) String roomPrice3, @RequestParam(name="roomId3", required=false, defaultValue="0") int roomId3
			, @RequestParam(name="roomType4", required=false) String roomType4, @RequestParam(name="roomCount4", required=false, defaultValue="0") int roomCount4, @RequestParam(name="roomPrice4", required=false) String roomPrice4, @RequestParam(name="roomId4", required=false, defaultValue="0") int roomId4
			, @RequestParam(name="roomType5", required=false) String roomType5, @RequestParam(name="roomCount5", required=false, defaultValue="0") int roomCount5, @RequestParam(name="roomPrice5", required=false) String roomPrice5, @RequestParam(name="roomId5", required=false, defaultValue="0") int roomId5
			, @RequestParam(name="roomType6", required=false) String roomType6, @RequestParam(name="roomCount6", required=false, defaultValue="0") int roomCount6, @RequestParam(name="roomPrice6", required=false) String roomPrice6, @RequestParam(name="roomId6", required=false, defaultValue="0") int roomId6
			, @RequestParam(name="roomType7", required=false) String roomType7, @RequestParam(name="roomCount7", required=false, defaultValue="0") int roomCount7, @RequestParam(name="roomPrice7", required=false) String roomPrice7, @RequestParam(name="roomId7", required=false, defaultValue="0") int roomId7
			, @RequestParam(name="roomType8", required=false) String roomType8, @RequestParam(name="roomCount8", required=false, defaultValue="0") int roomCount8, @RequestParam(name="roomPrice8", required=false) String roomPrice8, @RequestParam(name="roomId8", required=false, defaultValue="0") int roomId8
			, @RequestParam(name="roomType9", required=false) String roomType9, @RequestParam(name="roomCount9", required=false, defaultValue="0") int roomCount9, @RequestParam(name="roomPrice9", required=false) String roomPrice9, @RequestParam(name="roomId9", required=false, defaultValue="0") int roomId9
			, Model model){
		
		Room r1=null;
		Room r2=null;
		Room r3=null;
		Room r4=null;
		Room r5=null;
		Room r6=null;
		Room r7=null;
		Room r8=null;
		Room r9=null;
		ArrayList<Room> list=new ArrayList<Room>();
		
		if(roomType2 != null){
			if(roomType3 != null){
				if(roomType4 != null){
					if(roomType5 != null){
						if(roomType6 != null){
							if(roomType7 != null){
								if(roomType8 != null){
									if(roomType9 != null){
										r1=new Room();
										r1.setcId(cId);
										r1.setrId(roomId1);
										r1.setRoomType(roomType1);
										r1.setRoomCount(roomCount1);
										r1.setRoomPrice(Integer.parseInt(roomPrice1));
										
										r2=new Room();
										r2.setcId(cId);
										r2.setrId(roomId2);
										r2.setRoomType(roomType2);
										r2.setRoomCount(roomCount2);
										r2.setRoomPrice(Integer.parseInt(roomPrice2));
										
										r3=new Room();
										r3.setcId(cId);
										r3.setrId(roomId3);
										r3.setRoomType(roomType3);
										r3.setRoomCount(roomCount3);
										r3.setRoomPrice(Integer.parseInt(roomPrice3));
										
										r4=new Room();
										r4.setcId(cId);
										r4.setrId(roomId4);
										r4.setRoomType(roomType4);
										r4.setRoomCount(roomCount4);
										r4.setRoomPrice(Integer.parseInt(roomPrice4));
										
										r5=new Room();
										r5.setcId(cId);
										r5.setrId(roomId5);
										r5.setRoomType(roomType5);
										r5.setRoomCount(roomCount5);
										r5.setRoomPrice(Integer.parseInt(roomPrice5));
										
										r6=new Room();
										r6.setcId(cId);
										r6.setrId(roomId6);
										r6.setRoomType(roomType6);
										r6.setRoomCount(roomCount6);
										r6.setRoomPrice(Integer.parseInt(roomPrice6));
										
										r7=new Room();
										r7.setcId(cId);
										r7.setrId(roomId7);
										r7.setRoomType(roomType7);
										r7.setRoomCount(roomCount7);
										r7.setRoomPrice(Integer.parseInt(roomPrice7));
										
										r8=new Room();
										r8.setcId(cId);
										r8.setrId(roomId8);
										r8.setRoomType(roomType8);
										r8.setRoomCount(roomCount8);
										r8.setRoomPrice(Integer.parseInt(roomPrice8));
										
										r9=new Room();
										r9.setcId(cId);
										r9.setrId(roomId9);
										r9.setRoomType(roomType9);
										r9.setRoomCount(roomCount9);
										r9.setRoomPrice(Integer.parseInt(roomPrice9));
										
										list.add(r1);
										list.add(r2);
										list.add(r3);
										list.add(r4);
										list.add(r5);
										list.add(r6);
										list.add(r7);
										list.add(r8);
										list.add(r9);
									}
									else{
										r1=new Room();
										r1.setcId(cId);
										r1.setrId(roomId1);
										r1.setRoomType(roomType1);
										r1.setRoomCount(roomCount1);
										r1.setRoomPrice(Integer.parseInt(roomPrice1));
										
										r2=new Room();
										r2.setcId(cId);
										r2.setrId(roomId2);
										r2.setRoomType(roomType2);
										r2.setRoomCount(roomCount2);
										r2.setRoomPrice(Integer.parseInt(roomPrice2));
										
										r3=new Room();
										r3.setcId(cId);
										r3.setrId(roomId3);
										r3.setRoomType(roomType3);
										r3.setRoomCount(roomCount3);
										r3.setRoomPrice(Integer.parseInt(roomPrice3));
										
										r4=new Room();
										r4.setcId(cId);
										r4.setrId(roomId4);
										r4.setRoomType(roomType4);
										r4.setRoomCount(roomCount4);
										r4.setRoomPrice(Integer.parseInt(roomPrice4));
										
										r5=new Room();
										r5.setcId(cId);
										r5.setrId(roomId5);
										r5.setRoomType(roomType5);
										r5.setRoomCount(roomCount5);
										r5.setRoomPrice(Integer.parseInt(roomPrice5));
										
										r6=new Room();
										r6.setcId(cId);
										r6.setrId(roomId6);
										r6.setRoomType(roomType6);
										r6.setRoomCount(roomCount6);
										r6.setRoomPrice(Integer.parseInt(roomPrice6));
										
										r7=new Room();
										r7.setcId(cId);
										r7.setrId(roomId7);
										r7.setRoomType(roomType7);
										r7.setRoomCount(roomCount7);
										r7.setRoomPrice(Integer.parseInt(roomPrice7));
										
										r8=new Room();
										r8.setcId(cId);
										r8.setrId(roomId8);
										r8.setRoomType(roomType8);
										r8.setRoomCount(roomCount8);
										r8.setRoomPrice(Integer.parseInt(roomPrice8));
										
										list.add(r1);
										list.add(r2);
										list.add(r3);
										list.add(r4);
										list.add(r5);
										list.add(r6);
										list.add(r7);
										list.add(r8);
									}
								}
								else{
									r1=new Room();
									r1.setcId(cId);
									r1.setrId(roomId1);
									r1.setRoomType(roomType1);
									r1.setRoomCount(roomCount1);
									r1.setRoomPrice(Integer.parseInt(roomPrice1));
									
									r2=new Room();
									r2.setcId(cId);
									r2.setrId(roomId2);
									r2.setRoomType(roomType2);
									r2.setRoomCount(roomCount2);
									r2.setRoomPrice(Integer.parseInt(roomPrice2));
									
									r3=new Room();
									r3.setcId(cId);
									r3.setrId(roomId3);
									r3.setRoomType(roomType3);
									r3.setRoomCount(roomCount3);
									r3.setRoomPrice(Integer.parseInt(roomPrice3));
									
									r4=new Room();
									r4.setcId(cId);
									r4.setrId(roomId4);
									r4.setRoomType(roomType4);
									r4.setRoomCount(roomCount4);
									r4.setRoomPrice(Integer.parseInt(roomPrice4));
									
									r5=new Room();
									r5.setcId(cId);
									r5.setrId(roomId5);
									r5.setRoomType(roomType5);
									r5.setRoomCount(roomCount5);
									r5.setRoomPrice(Integer.parseInt(roomPrice5));
									
									r6=new Room();
									r6.setcId(cId);
									r6.setrId(roomId6);
									r6.setRoomType(roomType6);
									r6.setRoomCount(roomCount6);
									r6.setRoomPrice(Integer.parseInt(roomPrice6));
									
									r7=new Room();
									r7.setcId(cId);
									r7.setrId(roomId7);
									r7.setRoomType(roomType7);
									r7.setRoomCount(roomCount7);
									r7.setRoomPrice(Integer.parseInt(roomPrice7));
									
									list.add(r1);
									list.add(r2);
									list.add(r3);
									list.add(r4);
									list.add(r5);
									list.add(r6);
									list.add(r7);
								}
							}
							else{
								r1=new Room();
								r1.setcId(cId);
								r1.setrId(roomId1);
								r1.setRoomType(roomType1);
								r1.setRoomCount(roomCount1);
								r1.setRoomPrice(Integer.parseInt(roomPrice1));
								
								r2=new Room();
								r2.setcId(cId);
								r2.setrId(roomId2);
								r2.setRoomType(roomType2);
								r2.setRoomCount(roomCount2);
								r2.setRoomPrice(Integer.parseInt(roomPrice2));
								
								r3=new Room();
								r3.setcId(cId);
								r3.setrId(roomId3);
								r3.setRoomType(roomType3);
								r3.setRoomCount(roomCount3);
								r3.setRoomPrice(Integer.parseInt(roomPrice3));
								
								r4=new Room();
								r4.setcId(cId);
								r4.setrId(roomId4);
								r4.setRoomType(roomType4);
								r4.setRoomCount(roomCount4);
								r4.setRoomPrice(Integer.parseInt(roomPrice4));
								
								r5=new Room();
								r5.setcId(cId);
								r5.setrId(roomId5);
								r5.setRoomType(roomType5);
								r5.setRoomCount(roomCount5);
								r5.setRoomPrice(Integer.parseInt(roomPrice5));
								
								r6=new Room();
								r6.setcId(cId);
								r6.setrId(roomId6);
								r6.setRoomType(roomType6);
								r6.setRoomCount(roomCount6);
								r6.setRoomPrice(Integer.parseInt(roomPrice6));
								
								list.add(r1);
								list.add(r2);
								list.add(r3);
								list.add(r4);
								list.add(r5);
								list.add(r6);
							}
						}
						else{
							r1=new Room();
							r1.setcId(cId);
							r1.setrId(roomId1);
							r1.setRoomType(roomType1);
							r1.setRoomCount(roomCount1);
							r1.setRoomPrice(Integer.parseInt(roomPrice1));
							
							r2=new Room();
							r2.setcId(cId);
							r2.setrId(roomId2);
							r2.setRoomType(roomType2);
							r2.setRoomCount(roomCount2);
							r2.setRoomPrice(Integer.parseInt(roomPrice2));
							
							r3=new Room();
							r3.setcId(cId);
							r3.setrId(roomId3);
							r3.setRoomType(roomType3);
							r3.setRoomCount(roomCount3);
							r3.setRoomPrice(Integer.parseInt(roomPrice3));
							
							r4=new Room();
							r4.setcId(cId);
							r4.setrId(roomId4);
							r4.setRoomType(roomType4);
							r4.setRoomCount(roomCount4);
							r4.setRoomPrice(Integer.parseInt(roomPrice4));
							
							r5=new Room();
							r5.setcId(cId);
							r5.setrId(roomId5);
							r5.setRoomType(roomType5);
							r5.setRoomCount(roomCount5);
							r5.setRoomPrice(Integer.parseInt(roomPrice5));
							
							list.add(r1);
							list.add(r2);
							list.add(r3);
							list.add(r4);
							list.add(r5);
						}
					}
					else{
						r1=new Room();
						r1.setcId(cId);
						r1.setrId(roomId1);
						r1.setRoomType(roomType1);
						r1.setRoomCount(roomCount1);
						r1.setRoomPrice(Integer.parseInt(roomPrice1));
						
						r2=new Room();
						r2.setcId(cId);
						r2.setrId(roomId2);
						r2.setRoomType(roomType2);
						r2.setRoomCount(roomCount2);
						r2.setRoomPrice(Integer.parseInt(roomPrice2));
						
						r3=new Room();
						r3.setcId(cId);
						r3.setrId(roomId3);
						r3.setRoomType(roomType3);
						r3.setRoomCount(roomCount3);
						r3.setRoomPrice(Integer.parseInt(roomPrice3));
						
						r4=new Room();
						r4.setcId(cId);
						r4.setrId(roomId4);
						r4.setRoomType(roomType4);
						r4.setRoomCount(roomCount4);
						r4.setRoomPrice(Integer.parseInt(roomPrice4));
						
						list.add(r1);
						list.add(r2);
						list.add(r3);
						list.add(r4);
					}
				}
				else{
					r1=new Room();
					r1.setcId(cId);
					r1.setrId(roomId1);
					r1.setRoomType(roomType1);
					r1.setRoomCount(roomCount1);
					r1.setRoomPrice(Integer.parseInt(roomPrice1));
					
					r2=new Room();
					r2.setcId(cId);
					r2.setrId(roomId2);
					r2.setRoomType(roomType2);
					r2.setRoomCount(roomCount2);
					r2.setRoomPrice(Integer.parseInt(roomPrice2));
					
					r3=new Room();
					r3.setcId(cId);
					r3.setrId(roomId3);
					r3.setRoomType(roomType3);
					r3.setRoomCount(roomCount3);
					r3.setRoomPrice(Integer.parseInt(roomPrice3));
					
					list.add(r1);
					list.add(r2);
					list.add(r3);
				}
			}
			else{
				r1=new Room();
				r1.setcId(cId);
				r1.setrId(roomId1);
				r1.setRoomType(roomType1);
				r1.setRoomCount(roomCount1);
				r1.setRoomPrice(Integer.parseInt(roomPrice1));
				
				r2=new Room();
				r2.setcId(cId);
				r2.setrId(roomId2);
				r2.setRoomType(roomType2);
				r2.setRoomCount(roomCount2);
				r2.setRoomPrice(Integer.parseInt(roomPrice2));
				
				list.add(r1);
				list.add(r2);
			}
		}
		else{
			r1=new Room();
			r1.setcId(cId);
			r1.setrId(roomId1);
			r1.setRoomType(roomType1);
			r1.setRoomCount(roomCount1);
			r1.setRoomPrice(Integer.parseInt(roomPrice1));
			
			list.add(r1);
		}

		System.out.println("controller list : " + list);
		
		int result=ss.updateProduct(list);
		
		if(result > 0){
			ArrayList<OneProduct> opList=ss.selectOneProduct(cId, crId);
			
			model.addAttribute("opList", opList);
			
			return "seller/detailCompany";
		}
		else{
			model.addAttribute("msg", "업체 수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
	//등록 기간 연장
	@RequestMapping(value="extendsPeriod.sell")
	public String extendsPeriod(@RequestParam String cId, @RequestParam String term, Model model, HttpServletRequest request){
		
		int result=ss.extendsPeriod(cId, term);
		
		if(result > 0){
			Member m=(Member)request.getSession().getAttribute("loginUser");
			
			ArrayList<SearchProduct> list=null;
			PageInfo pi=null;
			int listCount=0;
			
			listCount=ss.getProductListCount(m.getmId());
			pi=Pagination.getPageInfo(1, listCount);
			list=ss.selectProductList(m.getmId(), pi);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
			return "seller/manageProduct";
		}
		else{
			model.addAttribute("msg", "기간 연장 실패");
			
			return "common/errorPage";
		}
	}
	
	//예약 관리
	@RequestMapping(value="reservation.sell")
	public String reservation(Model model, HttpServletRequest request, PageInfo p, String searchParam, String searchWord, String fromDate, String toDate){
		Member m=(Member)request.getSession().getAttribute("loginUser");
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		ArrayList<SellerReservation> list=null;
		PageInfo pi=null;
		int listCount=0;
		
		if(searchParam == null && searchWord == null){
			listCount=ss.getReservationListCount(m.getmId());
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectReservationList(m.getmId(), pi);
		}
		else if(searchParam.equals("datePick")){
			listCount=ss.getSearchDateReservationListCount(m.getmId(), toDate, fromDate);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchDateReservationList(m.getmId(), toDate, fromDate, pi);
		}
		else{
			SellerReservation sr=new SellerReservation();
			
			if(searchParam.equals("oName")){
				sr.setPaName(searchWord);
			}
			else{
				if(searchWord.equals("결제완료")){
					searchWord="P";
				}
				else if(searchWord.equals("환불완료")){
					searchWord="R";
				}
				sr.setStatus(searchWord);
			}
			
			listCount=ss.getSearchWordReservationListCount(m.getmId(), sr);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchWordReservationList(m.getmId(), sr, pi);
		}
			
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStatus().equals("P")){
				list.get(i).setStatus("결제완료");
			}
			else if(list.get(i).getStatus().equals("R")){
				list.get(i).setStatus("환불완료");
			}
		}
			
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
			
		return "seller/reservation";
	}
	
	//예약 상세 보기
	@RequestMapping(value="reservationDetail.sell")
	public void reservationDetail(int oId, HttpServletResponse response){
		
		try {
			ArrayList<SellerOneReservation> sor=ss.selectOneReservation(oId);
			
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out=response.getWriter();
			JSONObject json=new JSONObject();
			json.put("data", sor);
			
			out.print(json);
			
			out.flush();
			out.close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//수익 관리
	@RequestMapping("manageRevenue.sell")
	public String manageRevenue(Model model, HttpServletRequest request, PageInfo p, String searchParam, String searchWord, String fromDate, String toDate){
		Member m=(Member)request.getSession().getAttribute("loginUser");
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		ArrayList<Revenue> list=null;
		PageInfo pi=null;
		int listCount=0;
		
		if(searchParam == null && searchWord == null){
			listCount=ss.getRevenueListCount(m.getmId());
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectRevenueList(m.getmId(), pi);
		}
		else if(searchParam.equals("datePick")){
			listCount=ss.getSearchDateRevenueListCount(m.getmId(), toDate, fromDate);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchDateRevenueList(m.getmId(), toDate, fromDate, pi);
		}
		else{
			Revenue r=new Revenue();
			
			if(searchParam.equals("cName")){
				r.setcName(searchWord);
			}
			else{
				if(searchWord.equals("입금전")){
					searchWord="B";
				}
				else if(searchWord.equals("입금완료")){
					searchWord="A";
				}
				r.setStatus(searchWord);
			}
			
			listCount=ss.getSearchWordRevenueListCount(m.getmId(), r);
			pi=Pagination.getPageInfo(p.getCurrentPage(), listCount);
			list=ss.selectSearchWordRevenueList(m.getmId(), r, pi);
		}
			
		for(int i=0;i<list.size();i++){
			if(list.get(i).getStatus().equals("B")){
				list.get(i).setStatus("입금전");
			}
			else if(list.get(i).getStatus().equals("A")){
				list.get(i).setStatus("입금완료");
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "seller/manageRevenue";
	}
	
}
