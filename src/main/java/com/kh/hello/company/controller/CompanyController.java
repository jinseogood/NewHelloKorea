package com.kh.hello.company.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.company.model.service.CompanyService;
import com.kh.hello.company.model.vo.Company2;
import com.kh.hello.company.model.vo.Reservation2;
import com.kh.hello.company.model.vo.Reservations;
import com.kh.hello.company.model.vo.Room2;
import com.kh.hello.member.model.vo.Member;

import net.sf.json.JSONObject;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService cs;
	
	@RequestMapping(value="searchHotelAreaPage.com")
	public void searchHotelAreaPage(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode,@ RequestParam String sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		Company2 cp = new Company2();
		cp.setAreaCode(areaCode);
		cp.setSigunguCode(sigunguCode);
		if(areaCode == 1){
			cp.setAreaName("서울");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강남구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("강동구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("강북구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("강서구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("관악구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("광진구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("구로구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("금천구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("노원구");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("도봉구");
			}else if(sigunguCode.equals("11")){
				cp.setSigunguName("동대문구");
			}else if(sigunguCode.equals("12")){
				cp.setSigunguName("동작구");
			}else if(sigunguCode.equals("13")){
				cp.setSigunguName("마포구");
			}else if(sigunguCode.equals("14")){
				cp.setSigunguName("서대문구");
			}else if(sigunguCode.equals("15")){
				cp.setSigunguName("서초구");
			}else if(sigunguCode.equals("16")){
				cp.setSigunguName("성동구");
			}else if(sigunguCode.equals("17")){
				cp.setSigunguName("성북구");
			}else if(sigunguCode.equals("18")){
				cp.setSigunguName("송파구");
			}else if(sigunguCode.equals("19")){
				cp.setSigunguName("양천구");
			}else if(sigunguCode.equals("20")){
				cp.setSigunguName("영등포구");
			}else if(sigunguCode.equals("21")){
				cp.setSigunguName("용산구");
			}else if(sigunguCode.equals("22")){
				cp.setSigunguName("은평구");
			}else if(sigunguCode.equals("23")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("24")){
				cp.setSigunguName("중랑구");
			}else if(sigunguCode.equals("25")){
				cp.setSigunguName("강북");
			}
		}else if(areaCode == 2){
			cp.setAreaName("인천");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강화군");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("계양구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("남동구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("부평구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("연수구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("옹진군");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 3){
			cp.setAreaName("대전");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("대덕구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("유성구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 4){
			cp.setAreaName("대구");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("달서구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("달성군");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("수성구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 5){
			cp.setAreaName("광주");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("광산구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("서구");
			}
		}else if(areaCode == 6){
			cp.setAreaName("부산");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강서구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("금정구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("기장군");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("동래구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("부산진구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("사상구");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("사하구");
			}else if(sigunguCode.equals("11")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("12")){
				cp.setSigunguName("수영구");
			}else if(sigunguCode.equals("13")){
				cp.setSigunguName("연제구");
			}else if(sigunguCode.equals("14")){
				cp.setSigunguName("영도구");
			}else if(sigunguCode.equals("15")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("16")){
				cp.setSigunguName("해운대구");
			}
		}else if(areaCode == 7){
			cp.setAreaName("울산");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("울주군");
			}
		}else if(areaCode == 8){
			cp.setAreaName("세종특별자치시");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("세종특별자치시");
			}
		}/*else if(areaCode == 31){
			cp.setAreaName("경기도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("가평군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("고양시");
			}else if(sigunguCode == 3){
				cp.setSigunguName("과천시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("광명시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("광주시");
			}else if(sigunguCode == 6){
				cp.setSigunguName("구리시");
			}else if(sigunguCode == 7){
				cp.setSigunguName("군포시");
			}else if(sigunguCode == 8){
				cp.setSigunguName("김포시");
			}else if(sigunguCode == 9){
				cp.setSigunguName("남양주시");
			}else if(sigunguCode == 10){
				cp.setSigunguName("동두천시");
			}else if(sigunguCode == 11){
				cp.setSigunguName("부천시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("성남시");
			}else if(sigunguCode == 13){
				cp.setSigunguName("수원시");
			}else if(sigunguCode == 14){
				cp.setSigunguName("시흥시");
			}else if(sigunguCode == 15){
				cp.setSigunguName("안산시");
			}else if(sigunguCode == 16){
				cp.setSigunguName("안성시");
			}else if(sigunguCode == 17){
				cp.setSigunguName("안양시");
			}else if(sigunguCode == 18){
				cp.setSigunguName("양주시");
			}else if(sigunguCode == 19){
				cp.setSigunguName("양평군");
			}else if(sigunguCode == 20){
				cp.setSigunguName("여주시");
			}else if(sigunguCode == 21){
				cp.setSigunguName("연천군");
			}else if(sigunguCode == 22){
				cp.setSigunguName("오산시");
			}else if(sigunguCode == 23){
				cp.setSigunguName("용인시");
			}else if(sigunguCode == 24){
				cp.setSigunguName("의왕시");
			}else if(sigunguCode == 25){
				cp.setSigunguName("의정부시");
			}else if(sigunguCode == 26){
				cp.setSigunguName("이천시");
			}else if(sigunguCode == 27){
				cp.setSigunguName("파주시");
			}else if(sigunguCode == 28){
				cp.setSigunguName("평택시");
			}else if(sigunguCode == 29){
				cp.setSigunguName("포천시");
			}else if(sigunguCode == 30){
				cp.setSigunguName("하남시");
			}else if(sigunguCode == 31){
				cp.setSigunguName("화성시");
			}
		}else if(areaCode == 32){
			cp.setAreaName("강원도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("강릉시");
			}else if(sigunguCode == 2){
				cp.setSigunguName("고성군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("동해시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("삼척시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("속초시");
			}else if(sigunguCode == 6){
				cp.setSigunguName("양구군");
			}else if(sigunguCode == 7){
				cp.setSigunguName("양양군");
			}else if(sigunguCode == 8){
				cp.setSigunguName("영월군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("원주시");
			}else if(sigunguCode == 11){
				cp.setSigunguName("인제군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("정성군");
			}else if(sigunguCode == 12){
				cp.setSigunguName("철원군");
			}else if(sigunguCode == 13){
				cp.setSigunguName("춘천시");
			}else if(sigunguCode == 14){
				cp.setSigunguName("태백시");
			}else if(sigunguCode == 15){
				cp.setSigunguName("평창군");
			}else if(sigunguCode == 16){
				cp.setSigunguName("홍천군");
			}else if(sigunguCode == 17){
				cp.setSigunguName("화천군");
			}else if(sigunguCode == 18){
				cp.setSigunguName("횡성군");
			}
		}else if(areaCode == 33){
			cp.setAreaName("충청북도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("괴산군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("단양군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("보은군");
			}else if(sigunguCode == 4){
				cp.setSigunguName("영동군");
			}else if(sigunguCode == 5){
				cp.setSigunguName("옥천군");
			}else if(sigunguCode == 6){
				cp.setSigunguName("음성군");
			}else if(sigunguCode == 7){
				cp.setSigunguName("제천시");
			}else if(sigunguCode == 8){
				cp.setSigunguName("진천군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("청원군");
			}else if(sigunguCode == 10){
				cp.setSigunguName("청주시");
			}else if(sigunguCode == 11){
				cp.setSigunguName("충주시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("증평군");
			}
		}else if(areaCode == 34){
			cp.setAreaName("충청남도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("공주시");
			}else if(sigunguCode == 2){
				cp.setSigunguName("금산군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("논산시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("당진시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("보령시");
			}else if(sigunguCode == 6){
				cp.setSigunguName("부여군");
			}else if(sigunguCode == 7){
				cp.setSigunguName("서산시");
			}else if(sigunguCode == 8){
				cp.setSigunguName("서천군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("아산시");
			}else if(sigunguCode == 10){
				cp.setSigunguName("예산군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("천안시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("청양군");
			}else if(sigunguCode == 13){
				cp.setSigunguName("태안군");
			}else if(sigunguCode == 14){
				cp.setSigunguName("홍성군");
			}else if(sigunguCode == 15){
				cp.setSigunguName("계룡시");
			}
		}else if(areaCode == 35){
			cp.setAreaName("경상북도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("경산시");
			}else if(sigunguCode == 2){
				cp.setSigunguName("경주시");
			}else if(sigunguCode == 3){
				cp.setSigunguName("고령군");
			}else if(sigunguCode == 4){
				cp.setSigunguName("구미시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("군위군");
			}else if(sigunguCode == 6){
				cp.setSigunguName("김천시");
			}else if(sigunguCode == 7){
				cp.setSigunguName("문경시");
			}else if(sigunguCode == 8){
				cp.setSigunguName("봉화군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("상주시");
			}else if(sigunguCode == 10){
				cp.setSigunguName("성주군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("안동시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("영덕군");
			}else if(sigunguCode == 13){
				cp.setSigunguName("영양군");
			}else if(sigunguCode == 14){
				cp.setSigunguName("영주시");
			}else if(sigunguCode == 15){
				cp.setSigunguName("영천시");
			}else if(sigunguCode == 16){
				cp.setSigunguName("예천군");
			}else if(sigunguCode == 17){
				cp.setSigunguName("울릉군");
			}else if(sigunguCode == 18){
				cp.setSigunguName("울진군");
			}else if(sigunguCode == 19){
				cp.setSigunguName("의성군");
			}else if(sigunguCode == 20){
				cp.setSigunguName("청도군");
			}else if(sigunguCode == 21){
				cp.setSigunguName("청송군");
			}else if(sigunguCode == 22){
				cp.setSigunguName("칠곡군");
			}else if(sigunguCode == 23){
				cp.setSigunguName("포항시");
			}
		}else if(areaCode == 36){
			cp.setAreaName("경상남도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("거제시");
			}else if(sigunguCode == 2){
				cp.setSigunguName("고창군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("김해시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("남해군");
			}else if(sigunguCode == 5){
				cp.setSigunguName("마산시");
			}else if(sigunguCode == 6){
				cp.setSigunguName("밀양시");
			}else if(sigunguCode == 7){
				cp.setSigunguName("사천시");
			}else if(sigunguCode == 8){
				cp.setSigunguName("산청군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("양산시");
			}else if(sigunguCode == 10){
				cp.setSigunguName("의령군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("진주시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("진해시");
			}else if(sigunguCode == 13){
				cp.setSigunguName("창녕군");
			}else if(sigunguCode == 14){
				cp.setSigunguName("창원시");
			}else if(sigunguCode == 15){
				cp.setSigunguName("통영시");
			}else if(sigunguCode == 16){
				cp.setSigunguName("하동군");
			}else if(sigunguCode == 17){
				cp.setSigunguName("함안군");
			}else if(sigunguCode == 18){
				cp.setSigunguName("함양군");
			}else if(sigunguCode == 19){
				cp.setSigunguName("합천군");
			}
		}else if(areaCode == 37){
			cp.setAreaName("전라북도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("고창군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("군산시");
			}else if(sigunguCode == 3){
				cp.setSigunguName("김제시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("남원시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("무주군");
			}else if(sigunguCode == 6){
				cp.setSigunguName("부안군");
			}else if(sigunguCode == 7){
				cp.setSigunguName("순창군");
			}else if(sigunguCode == 8){
				cp.setSigunguName("완주군");
			}else if(sigunguCode == 9){
				cp.setSigunguName("익산시");
			}else if(sigunguCode == 10){
				cp.setSigunguName("임실군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("장수군");
			}else if(sigunguCode == 12){
				cp.setSigunguName("전주시");
			}else if(sigunguCode == 13){
				cp.setSigunguName("정읍시");
			}else if(sigunguCode == 14){
				cp.setSigunguName("진안군");
			}
		}else if(areaCode == 38){
			cp.setAreaName("전라남도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("강진군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("고흥군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("곡성군");
			}else if(sigunguCode == 4){
				cp.setSigunguName("광양시");
			}else if(sigunguCode == 5){
				cp.setSigunguName("구례군");
			}else if(sigunguCode == 6){
				cp.setSigunguName("나주시");
			}else if(sigunguCode == 7){
				cp.setSigunguName("담양군");
			}else if(sigunguCode == 8){
				cp.setSigunguName("목포시");
			}else if(sigunguCode == 9){
				cp.setSigunguName("무안군");
			}else if(sigunguCode == 10){
				cp.setSigunguName("보성군");
			}else if(sigunguCode == 11){
				cp.setSigunguName("순천시");
			}else if(sigunguCode == 12){
				cp.setSigunguName("신안군");
			}else if(sigunguCode == 13){
				cp.setSigunguName("여수시");
			}else if(sigunguCode == 14){
				cp.setSigunguName("영광군");
			}else if(sigunguCode == 15){
				cp.setSigunguName("영암군");
			}else if(sigunguCode == 16){
				cp.setSigunguName("완도군");
			}else if(sigunguCode == 17){
				cp.setSigunguName("장성군");
			}else if(sigunguCode == 18){
				cp.setSigunguName("장흥군");
			}else if(sigunguCode == 19){
				cp.setSigunguName("진도군");
			}else if(sigunguCode == 20){
				cp.setSigunguName("함평군");
			}else if(sigunguCode == 21){
				cp.setSigunguName("해남군");
			}else if(sigunguCode == 22){
				cp.setSigunguName("화순군");
			}
		}else if(areaCode == 39){
			cp.setAreaName("제주도");
			if(sigunguCode == 0){
				cp.setSigunguName("");
			}else if(sigunguCode == 1){
				cp.setSigunguName("남제구군");
			}else if(sigunguCode == 2){
				cp.setSigunguName("북제주군");
			}else if(sigunguCode == 3){
				cp.setSigunguName("서귀포시");
			}else if(sigunguCode == 4){
				cp.setSigunguName("제주시");
			}
		}*/
		ArrayList<Company2> list = cs.selectAllCompany(cp);
		response.getWriter().print(mapper.writeValueAsString(list));
	}
	
	
	@RequestMapping(value="detailRoom.com")
	public void detailRoom(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid, @RequestParam int cid) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		Room2 roomList = new Room2();
		roomList.setCid(cid);
		
		ArrayList<Room2> list = cs.selectRoomList(roomList);
		response.getWriter().print(mapper.writeValueAsString(list));
	}
	
	
	@RequestMapping(value="reservationRoom.com")
	public String reservationRoom(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam int rid, @RequestParam int price, 
			@RequestParam String rType, @RequestParam int count, @RequestParam int limit, @RequestParam Date startDate, @RequestParam Date endDate) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		System.out.println("resrvation rid : " + rid);
		System.out.println("reservation price : " + price);
		System.out.println("reservation rType : " + rType);
		System.out.println("reservation count : " + count);
		System.out.println("reservation limit : " + limit);
		System.out.println("reservation user : " + userNo);
		
		Reservation2 reservation = new Reservation2();
		reservation.setPeople(limit);
		reservation.setoRcount(count);
		reservation.setRid(rid);
		reservation.setrSdate(startDate);
		reservation.setrEdate(endDate);
		
		
		reservation = cs.insertReservation(reservation);
		
		model.addAttribute("reservation", reservation);
		
		return "payment/detailPayment";
	}
	
	
	@RequestMapping(value="orderByHotel.com")
	public void orderByHotelName(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode,@ RequestParam String sigunguCode, @RequestParam String value) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		Company2 cp = new Company2();
		cp.setAreaCode(areaCode);
		cp.setSigunguCode(sigunguCode);
		if(areaCode == 1){
			cp.setAreaName("서울");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강남구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("강동구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("강북구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("강서구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("관악구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("광진구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("구로구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("금천구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("노원구");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("도봉구");
			}else if(sigunguCode.equals("11")){
				cp.setSigunguName("동대문구");
			}else if(sigunguCode.equals("12")){
				cp.setSigunguName("동작구");
			}else if(sigunguCode.equals("13")){
				cp.setSigunguName("마포구");
			}else if(sigunguCode.equals("14")){
				cp.setSigunguName("서대문구");
			}else if(sigunguCode.equals("15")){
				cp.setSigunguName("서초구");
			}else if(sigunguCode.equals("16")){
				cp.setSigunguName("성동구");
			}else if(sigunguCode.equals("17")){
				cp.setSigunguName("성북구");
			}else if(sigunguCode.equals("18")){
				cp.setSigunguName("송파구");
			}else if(sigunguCode.equals("19")){
				cp.setSigunguName("양천구");
			}else if(sigunguCode.equals("20")){
				cp.setSigunguName("영등포구");
			}else if(sigunguCode.equals("21")){
				cp.setSigunguName("용산구");
			}else if(sigunguCode.equals("22")){
				cp.setSigunguName("은평구");
			}else if(sigunguCode.equals("23")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("24")){
				cp.setSigunguName("중랑구");
			}else if(sigunguCode.equals("25")){
				cp.setSigunguName("강북");
			}
		}else if(areaCode == 2){
			cp.setAreaName("인천");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강화군");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("계양구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("남동구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("부평구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("연수구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("옹진군");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 3){
			cp.setAreaName("대전");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("대덕구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("유성구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 4){
			cp.setAreaName("대구");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("달서구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("달성군");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("수성구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("중구");
			}
		}else if(areaCode == 5){
			cp.setAreaName("광주");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("광산구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("서구");
			}
		}else if(areaCode == 6){
			cp.setAreaName("부산");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("강서구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("금정구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("기장군");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("6")){
				cp.setSigunguName("동래구");
			}else if(sigunguCode.equals("7")){
				cp.setSigunguName("부산진구");
			}else if(sigunguCode.equals("8")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("9")){
				cp.setSigunguName("사상구");
			}else if(sigunguCode.equals("10")){
				cp.setSigunguName("사하구");
			}else if(sigunguCode.equals("11")){
				cp.setSigunguName("서구");
			}else if(sigunguCode.equals("12")){
				cp.setSigunguName("수영구");
			}else if(sigunguCode.equals("13")){
				cp.setSigunguName("연제구");
			}else if(sigunguCode.equals("14")){
				cp.setSigunguName("영도구");
			}else if(sigunguCode.equals("15")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("16")){
				cp.setSigunguName("해운대구");
			}
		}else if(areaCode == 7){
			cp.setAreaName("울산");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("중구");
			}else if(sigunguCode.equals("2")){
				cp.setSigunguName("남구");
			}else if(sigunguCode.equals("3")){
				cp.setSigunguName("동구");
			}else if(sigunguCode.equals("4")){
				cp.setSigunguName("북구");
			}else if(sigunguCode.equals("5")){
				cp.setSigunguName("울주군");
			}
		}else if(areaCode == 8){
			cp.setAreaName("세종특별자치시");
			if(sigunguCode.equals("0")){
				cp.setSigunguName("");
			}else if(sigunguCode.equals("1")){
				cp.setSigunguName("세종특별자치시");
			}
		}
		
		System.out.println("value : " + value);
		if(value.equals("name")){//이름순정렬
			ArrayList<Company2> list = cs.selectOrderByName(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("grade")){//평점..
			ArrayList<Company2> list = cs.selectOrderByGrade(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("1")){//가격대 1번. 10만 ~ 19만9천
			ArrayList<Company2> list = cs.selectOrderByMoney1(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("2")){//가격대2번. 20만 ~ 29만9천
			ArrayList<Company2> list = cs.selectOrderByMoney2(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("3")){//가격대3번. 30만 ~
			ArrayList<Company2> list = cs.selectOrderByMoney3(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("twoAvg")){
			ArrayList<Company2> list = cs.selectOrderByTwoAvg(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("threeAvg")){
			ArrayList<Company2> list = cs.selectOrderByThreeAvg(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}else if(value.equals("fourAvg")){
			ArrayList<Company2> list = cs.selectOrderByFourAvg(cp);
			response.getWriter().print(mapper.writeValueAsString(list));			
		}else if(value.equals("fiveAvg")){
			ArrayList<Company2> list = cs.selectOrderByFiveAvg(cp);
			response.getWriter().print(mapper.writeValueAsString(list));
		}
	}
	
	
//	oid시퀀스, startdate, enddate, 인원, 객실수, rid(객실명) 업체주소
	@RequestMapping(value="reservationRooms.com")
	public String reservationRooms(HttpServletRequest request, HttpServletResponse response, String myJson, Model model) throws IOException{
		Gson gson = new Gson();
		Reservations[] array = gson.fromJson(myJson, Reservations[].class);
		List<Reservations> list = Arrays.asList(array);
		
		for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).toString());
		}
		
		list = cs.insertReservations(list);
		
		model.addAttribute("list", list);
		
		return "payment/detailPayment";
	}
	
	
	@RequestMapping(value="mainHotelData.com")
	public void mainHotelData(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		Company2 cp = new Company2();
		ArrayList<Company2> list = cs.selectCompanyTop3(cp);
		
		response.getWriter().print(mapper.writeValueAsString(list));
//		JSONObject json = new JSONObject();
//		json.put("list", list);
	}
	
	
	@RequestMapping(value="gradeCheck.com")
	public void gradeCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		Company2 cp = new Company2();
//		cp.setContentid(contentid);
//		
//		cp = cs.selectGradeCheck(cp);
//		System.out.println(cp);
		
	}
	
	
	
	
}
