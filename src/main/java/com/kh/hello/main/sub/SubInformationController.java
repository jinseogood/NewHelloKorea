package com.kh.hello.main.sub;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;

@Controller
public class SubInformationController {
//	String serviceKey = "dn3vWRY02Pirv839KBrlXzVvjjXHThnB6lp1wYUT%2BHy%2BmLCJMd%2FSu1yDCtoleyAv3PXGfeco4I92b3EjhSLFUg%3D%3D"; //태영

//	String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";	//태호
	String serviceKey = "lRA2TOqa4t6rYolYZxl06EbeZ5c1VKWsPv%2BjrBNzVXZ0GMomnEtvsmyd%2FwtZecokCvivPgPd3gTKk4BogDnr5Q%3D%3D";	//태호
//	String serviceKey = "2nKfo7CEANK9puEanDDyqUzwNOH0wnaYWW5UG2l4ZNhl7lnb6lm81JRPVmolx4RXcWVmyhoSHjqVf4AJFdlgRg%3D%3D";		//태호
//	String serviceKey = "VOojT%2FUVcidkM%2BUIsxUGc2mInFoFPlSOBUvkCvCqGLi1x7x3MYlKptGiWXnsFP6xPfgI9chYJ6MNNFvtIdZBXg%3D%3D";		//진서꺼
//	String serviceKey = "VOojT%2FUVcidkM%2BUIsxUGc2mInFoFPlSOBUvkCvCqGLi1x7x3MYlKptGiWXnsFP6xPfgI9chYJ6MNNFvtIdZBXg%3D%3D";		//진서꺼

	
//	searchAreaHotel 메인에서 시작시 조회.
	/*@RequestMapping(value="searchAreaHotel.sub")
	public void searchAreaHotel(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("subInfo_areaCode : " + areaCode);
		System.out.println("subInfo_sigunguCode : " + sigunguCode);
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";
		String serviceKey = "gjHNkA6CuLpGqjZjThqF2cAG485WmBKdnpGonBzSFk0L7qAnKuRm87jwXCq6%2BGv3WI2VRkHcp9Rzbiba1tjddQ%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
		
	}*/
	
	
//	searchAreaHotel 호텔 대표 이미지 조회. api로 다녀오기.
	@RequestMapping(value="hotelImageLoad.sub")
	public void hotelImageLoad(HttpServletRequest request, HttpServletResponse response, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=32";
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	@RequestMapping(value="aboutMainSeoulHotel.sub")
	public void aboutMainSeoul(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
		
	}
	
	
	@RequestMapping(value="aboutMainSeoulFood.sub")
	public void aboutMainSeoulFood(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";



		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=39";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "cat1=A05";
		parameter = parameter + "&" + "cat=A0502&cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="aboutMainSeoulGame.sub")
	public void aboutMainSeoulGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";



		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=12";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=A02";
		parameter = parameter + "&" + "cat=A0205&cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelInformation.sub")
	public void detailHotelInformation(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelImage.sub")
	public void detailHotelImage(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=";

		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "imageYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailHotelIntro.sub")
	public void detailHotelIntro(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";



		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "introYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailRoomInfo.sub")
	public void detailRoomInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchGoodStay.sub")
	public void searchGoodStay(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "goodStay=1";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchHanOk.sub")
	public void searchHanOk(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";



		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "hanOk=1";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchBenikia.sub")
	public void searchBenicia(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam int sigunguCode) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "benikia=1";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo=1";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchAreaFood.sub")
	public void searchAreaFood(HttpServletRequest request, HttpServletResponse response, @RequestParam String pageNo, @RequestParam int areaCode, @RequestParam String sigunguCode, @RequestParam String cat3) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";



		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId=39";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "cat1=A05&cat2=";
		parameter = parameter + "&" + "cat3="+cat3;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo="+pageNo;
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailFoodInformation.sub")
	public void detailFoodInformation(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailFoodImage.sub")
	public void detailFoodimage(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "imageYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailFoodIntro.sub")
	public void detailFoodIntro(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "introYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailMenuInfo.sub")
	public void detailMenuInfo(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "imageYN=N";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchAreaGame.sub")
	public void searchAreaGame(HttpServletRequest request, HttpServletResponse response, @RequestParam int areaCode, @RequestParam String sigunguCode, @RequestParam String contenttypeid, @RequestParam String pageNo) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "cat1=";
		parameter = parameter + "&" + "cat2=";
		parameter = parameter + "&" + "cat3=";
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo="+pageNo;
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailGameInformation.sub")
	public void detailGameInformation(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areacodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailGameImage.sub")
	public void detailGameImage(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "imageYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="detailGameIntro.sub")
	public void detailGameIntro(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "introYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="themeSearchCondition.sub")
	public void themeSearchCondition(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String parameter = "";
		System.out.println(contenttypeid);
		System.out.println(contentid);
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="searchGameCondition.sub")
	public void gameSearchCondition(HttpServletRequest request, HttpServletResponse response, @RequestParam String contenttypeid, @RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3, @RequestParam int pageNo) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";


		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode="+sigunguCode;
		parameter = parameter + "&" + "cat1="+cat1;
		parameter = parameter + "&" + "cat2="+cat2;
		parameter = parameter + "&" + "cat3="+cat3;
		parameter = parameter + "&" + "listYN=Y";
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A";
		parameter = parameter + "&" + "numOfRows=12";
		parameter = parameter + "&" + "pageNo="+pageNo;
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	@RequestMapping(value="mainFoodData.sub")
	public void mainFoodData(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}
	
	
	@RequestMapping(value="mainGameData.sub")
	public void mainGameData(HttpServletRequest request, HttpServletResponse response, @RequestParam int contenttypeid, @RequestParam int contentid) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "contentTypeId="+contenttypeid;
		parameter = parameter + "&" + "contentId="+contentid;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "defaultYN=Y";
		parameter = parameter + "&" + "firstImageYN=Y";
		parameter = parameter + "&" + "areaCodeYN=Y";
		parameter = parameter + "&" + "catcodeYN=Y";
		parameter = parameter + "&" + "addrinfoYN=Y";
		parameter = parameter + "&" + "mapinfoYN=Y";
		parameter = parameter + "&" + "overviewYN=Y";
		parameter = parameter + "&" + "transGuideYN=Y";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
		JSONObject json = new JSONObject();
		json.put("data", data);
	}


	
	
}
