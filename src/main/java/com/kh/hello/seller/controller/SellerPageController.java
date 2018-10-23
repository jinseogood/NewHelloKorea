package com.kh.hello.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerPageController {
	
	@RequestMapping("addCompanyView.sell")
	public String addCompanyView(){
		return "seller/addCompany";
	}
	
}
