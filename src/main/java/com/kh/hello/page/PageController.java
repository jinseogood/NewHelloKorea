package com.kh.hello.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("hotelView")
	public String mainView(){
		return "main/mainHotel";
	}
	
	@RequestMapping("foodView")
	public String aboutView(){
		return "main/mainFood";
	}
	
	@RequestMapping("toursView")
	public String toursView(){
		return "main/mainGame";
	}
	
}
