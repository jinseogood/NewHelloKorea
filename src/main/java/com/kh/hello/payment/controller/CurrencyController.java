package com.kh.hello.payment.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;

@Controller
@SessionAttributes("cur")
public class CurrencyController {
	
	@RequestMapping(value="currencyCheck.pay")
	public void currencyCheck(String cur, HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("check cur : " + cur);
		
		String addr = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=";
        String serviceKey = "forZLoVVwIvqXCL19weyohSBqll9az59";
        String parameter = "";
        parameter = parameter + "&" + "data=AP01";
         
        addr = addr + serviceKey + parameter;
        
		try {
			
			URL url = new URL(addr);
	         
	        InputStream in = url.openStream(); 
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	        
	        String data = bos.getOut().toString();
	        
	        PrintWriter out = response.getWriter();
	        out.println(data);
	        
	        JSONObject json = new JSONObject();
	        json.put("data", data);
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="currencySetting.pay")
	public void currencySetting(String cur, String sCur, Model model, HttpServletRequest request, HttpServletResponse response){
		int result=0;
		
		System.out.println("setting cur : " + cur);
		System.out.println("setting sCur : " + sCur);
		
		ArrayList<Object> currencyInfo=new ArrayList<Object>();
		
		if(sCur != null){
			
			if(cur.equals("AED")){
				cur="د.ا";
			}
			if(cur.equals("AUD")){
				cur="$";
			}
			if(cur.equals("BHD")){
				cur=".د.ب";
			}
			if(cur.equals("CAD")){
				cur="C$";
			}
			if(cur.equals("CHF")){
				cur="CHF";
			}
			if(cur.equals("CNH")){
				cur="¥";
			}
			if(cur.equals("DKK")){
				cur="kr";
			}
			if(cur.equals("EUR")){
				cur="€";
			}
			if(cur.equals("GBP")){
				cur="£";
			}
			if(cur.equals("HKD")){
				cur="HK$";
			}
			if(cur.equals("IDR(100)")){
				cur="Rp";	
			}
			if(cur.equals("JPY(100)")){
				cur="¥";
			}
			if(cur.equals("KRW")){
				cur="₩";
			}
			if(cur.equals("KWD")){
				cur="د.ك";
			}
			if(cur.equals("MYR")){
				cur="RM";
			}
			if(cur.equals("NOK")){
				cur="kr";
			}
			if(cur.equals("NZD")){
				cur="$";
			}
			if(cur.equals("SAR")){
				cur="ر.س";		
			}
			if(cur.equals("SEK")){
				cur="kr";
			}
			if(cur.equals("SGD")){
				cur="S$";
			}
			if(cur.equals("THB")){
				cur="฿";
			}
			if(cur.equals("USD")){
				cur="$";
			}
			
			currencyInfo.add(cur);
			currencyInfo.add(sCur);
			
			model.addAttribute("cur", currencyInfo);
			
			result=1;
		}
		else{
			result=0;
		}
		
		try {
			PrintWriter out=response.getWriter();
			
			out.print(result);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
