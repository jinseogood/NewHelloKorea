package com.kh.hello.main.sub;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;

@Controller
public class weatherController {
	
//	@RequestMapping(value="weatherMap.sub")
//	public void weatherMap(HttpServletRequest request, HttpServletResponse response, @RequestParam double mapy, @RequestParam double mapx) throws IOException{
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		URL url;
//		String result = null;
//		String Url_path = "http://api.openweathermap.org/data/2.5/weather?lat="+mapy+"&lon="+mapx+"&units=metric&mode=json&APPID=49736052d2b9402c5764e0f24834cf25";
//		HttpURLConnection con = null;
//		
//		
//		url = new URL(Url_path);
//
//		con = (HttpURLConnection)url.openConnection();
//		con.setRequestMethod("POST");
//		con.setRequestProperty("Cache-Control", "no-cache");
//		con.setRequestProperty("Content-Type", "application/json");
//		con.setRequestProperty("Accept", "application/json");
//		con.setDoOutput(true);
//		con.setDoInput(true);
//
//		int responseCode = con.getResponseCode();
//		if(responseCode != 200){
//			throw new IOException("Post failed with error code " + responseCode);
//		}
//
//		InputStreamReader tmp = new InputStreamReader(con.getInputStream(), "UTF-8");
//		BufferedReader reader = new BufferedReader(tmp);
//		StringBuilder builder = new StringBuilder();
//
//		String str;
//		while((str = reader.readLine()) != null){
//			builder.append(str);
//		}
//		result = builder.toString();
//
//		if(con != null){
//			con.disconnect();
//		}
//		
//		response.getWriter().println(result);
//		ObjectMapper mapper = new ObjectMapper();
//		response.getWriter().print(mapper.writeValueAsString(result));
//	}
	
	@RequestMapping(value="weatherMapInfo.sub")
	public void weatherMap(HttpServletRequest request, HttpServletResponse response, @RequestParam double mapy, @RequestParam double mapx) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String addr = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&APPID=4e95de8308c48e4d1d7d0596f92d4d4d";
		//String addr = "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=";
		//String appid = "4e95de8308c48e4d1d7d0596f92d4d4d";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		parameter = parameter + "&" + "lat="+mapy;
		parameter = parameter + "&" + "lon="+mapx;
		parameter = parameter + "&" + "units=metric";
		parameter = parameter + "&" + "mode=json";
		
		//addr = addr + appid + parameter;
		System.out.println(addr);
		URL url = new URL(addr);
		
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		
		String data = bos.getOut().toString();
		out.println(data);
		
//		response.getWriter().println(data);
		JSONObject json = new JSONObject();
		json.put("data", data);
		
		
	}
	
	
	
	
	

}
