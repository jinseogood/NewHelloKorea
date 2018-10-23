package com.kh.hello.good.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hello.good.model.service.GoodService;
import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;
import com.kh.hello.member.model.vo.Member;

@Controller
public class GoodController {
	@Autowired
	private GoodService gs;
	
	@RequestMapping(value="dibsHotel.good")
	public void selectDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid, @RequestParam int cid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("숙박");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		gg.setCid(cid);
		
//		이미 찜한 목록이 있는지 확인
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="insertDibsHotel.good")
	public void insertDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid, @RequestParam int cid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("숙박");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		gg.setCid(cid);
		
		result = gs.insertDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="deleteDibsHotel.good")
	public void deleteDibsHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setOriginId(contentid);
		gg.setMid(userNo);
		
		result = gs.deleteDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="dibsFood.good")
	public void selectDibsFood(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("음식점");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="insertDibsFood.good")
	public void insertDibsFood(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setlType("숙박");
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.insertDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="deleteDibsFood.good")
	public void deleteDibsFood(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setOriginId(contentid);
		gg.setMid(userNo);
		
		result = gs.deleteDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="dibsGame.good")
	public void selectDibsGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setMid(userNo);
		gg.setOriginId(contentid);
//		if(contenttypeid == 12){
//			gg.setlType("관광지");
//		}else if(contenttypeid == 14){
//			gg.setlType("문화시설");
//		}else if(contenttypeid == 15){
//			gg.setlType("축제행사");
//		}else{
//			gg.setlType("레포츠");
//		}
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="insertDibsGame.good")
	public void insertDibsGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		if(contenttypeid == 12){
			gg.setlType("관광지");
		}else if(contenttypeid == 14){
			gg.setlType("문화시설");
		}else if(contenttypeid == 15){
			gg.setlType("축제행사");
		}else{
			gg.setlType("레포츠");
		}
		
		result = gs.insertDibsHotel(gg);
		response.getWriter().println(result);
		
	}
	
	
	@RequestMapping(value="deleteDibsGame.good")
	public void deleteDibsGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setOriginId(contentid);
		gg.setMid(userNo);
		
		result = gs.deleteDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="dibsTheme.good")
	public void dibsTheme(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	@RequestMapping(value="insertDibsTheme.good")
	public void insertDibsTheme(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		//여기 contenttypeid 별로 if문 줘서 Good객체 생성해서 서비스로 보내기.
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="deleteDibsTheme.good")
	public void deleteDibsTheme(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.deleteDibsHotel(gg);
		response.getWriter().println(result);
	}
	
	@RequestMapping(value="dibsCheck.good")
	public void dibsCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good gg = new Good();
		gg.setMid(userNo);
		gg.setOriginId(contentid);
		
		result = gs.selectOneDibs(gg);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="dibsCheckStatus.good")
	public void dibsCheckStatus(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid, @RequestParam int contenttypeid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good2 gg2 = new Good2();
		gg2.setMid(userNo);
		gg2.setOriginId(contentid);
		
		result = gs.dibsCheckStatus(gg2);
		response.getWriter().println(result);
	}
	
	@RequestMapping(value="insertDibsInfo.good")
	public void insertDibsInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid, @RequestParam int contenttypeid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		
		Good2 gg2 = new Good2();
		gg2.setMid(userNo);
		gg2.setOriginId(contentid);
		if(contenttypeid == 38){
			gg2.setlType("쇼핑");
		}else if(contenttypeid == 12){
			gg2.setlType("관광지");
		}else if(contenttypeid == 14){
			gg2.setlType("문화시설");
		}else if(contenttypeid == 15){
			gg2.setlType("행사");
		}else if(contenttypeid == 28){
			gg2.setlType("레포츠");
		}else if(contenttypeid == 39){
			gg2.setlType("음식점");
		}
		result = gs.insertDibsInfo(gg2);
		response.getWriter().println(result);
	}
	
	@RequestMapping(value="deleteDibsInfo.good")
	public void deleteDibsInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid) throws IOException{
		String user = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getmId());
		int userNo = Integer.parseInt(user);
		int result = -99;
		Good2 gg2 = new Good2();
		gg2.setMid(userNo);
		gg2.setOriginId(contentid);
		
		result = gs.deleteDibsInfo(gg2);
		response.getWriter().println(result);
	}
	
	
	@RequestMapping(value="dibsGradeInfo")
	public void dibsGradeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ArrayList<Good2> list = gs.dibsGradeInfo();
		System.out.println(list);
		response.getWriter().println(list);
	}
	
	
	
	

}
