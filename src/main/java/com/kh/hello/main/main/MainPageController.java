package com.kh.hello.main.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainPageController {
	
	@RequestMapping(value="areaHotelView.main")
	public String areaView(@RequestParam int areaCode, @RequestParam int sigunguCode, @RequestParam int pageNo){
		return "aboutArea/searchAreaHotel";
	}
	
	@RequestMapping(value="areaAllView.main")
	public String areaAllView(@RequestParam int areaCode){
		return "aboutArea/aboutAllArea";
	}
	
	
	@RequestMapping(value="areaFoodView.main")
	public String areaFoodView(@RequestParam int areaCode, @RequestParam int sigunguCode, @RequestParam String cat3){
		return "aboutArea/searchAreaFood";
	}
	
	
	@RequestMapping(value="areaGameView.main")
	public String areaGameView(@RequestParam int areaCode, @RequestParam int sigunguCode, @RequestParam int contenttypeid){
		return "aboutArea/searchAreaGame";
	}
	
	
	
	
	
	

}
