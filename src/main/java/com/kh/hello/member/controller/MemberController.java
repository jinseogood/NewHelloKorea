package com.kh.hello.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.CommonUtils;
import com.kh.hello.member.model.exception.LoginException;
import com.kh.hello.member.model.service.MemberService;
import com.kh.hello.member.model.vo.Member;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	@Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
   
    @Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    
    private OAuth2Operations oauthOperations;
	
	
	
	@RequestMapping(value ="insertUser.me")
	public String insertMember(Model model,Member m ){

		String encPassword = passwordEncoder.encode(m.getPassword());

		m.setPassword(encPassword);


		int result = ms.insertMember(m);
		
		//유저시퀀스
		int mid = ms.selectMemberSequence();

		if(result >0){

			System.out.println("mid : " + mid);

			model.addAttribute("mid", mid);
			return "member/addUserInfo";

		}else{
			System.out.println("실패");
			return "common/errorPage";
		}

	}

	@RequestMapping(value="insertSeller.me")
	public String insertSeller(Model model, Member m){

		String encPassword = passwordEncoder.encode(m.getPassword());
		
		m.setPassword(encPassword);
		System.out.println(m);

		int result = ms.insertSeller(m);
		
		int mid  = ms.selectSellerSequence();

		if(result > 0){
			
			model.addAttribute("mid", mid);
			return "member/addSellerInfo";
		}else{
			
			return "common/errorPage";
		}
	}

	@RequestMapping(value="login.me")
	public String loginUser(Model model, Member m){

		try {
			model.addAttribute("loginUser", ms.loginMember(m));
			System.out.println(m);
			System.out.println("로그인 성공");
			

			return "main/mainHotel";
		} catch (LoginException e) {
			model.addAttribute("msg",e.getMessage());

			return "common/errorPage";
		}
	}
	@RequestMapping(value="addUser.me")
	public String updateAddUser(Model model, Member m){

		System.out.println("m : 이거다"+m);


		int result = ms.updateAddUser(m);

		if(result >0){
			return "main/mainHotel";


		}else{
			return"common/errorPage";

		}
	}
		
	@RequestMapping(value="addSeller.me")
	public String updateAddSeller(Model model, Member m){
		
		System.out.println("m seller:"+m);
		int result = ms.updateAddSeller(m);
		
		if(result >0){
			return "main/mainHotel";
		}else{
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping(value="logout.me")
	public String logout(SessionStatus status){
		
		status.setComplete();
		
		return "main/mainHotel";
		
	}
	
	
	
	

	@RequestMapping(value="facebook.me")
	public void facebookLogin(Model model,HttpServletResponse response){
		
		 	OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
	        
	        ObjectMapper mapper = new ObjectMapper();
	        
	        try {
				response.getWriter().println(mapper.writeValueAsString(facebook_url));
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	       /* model.addAttribute("facebook_url", facebook_url);*/
	        System.out.println("/facebook" + facebook_url);
	 
		
		
		/*return "main/main";*/
		
	}
	@RequestMapping(value = "facebookCallback.me", method = { RequestMethod.GET, RequestMethod.POST })
	    public String facebookSignInCallback(@RequestParam String code,Member m,Model model) throws Exception {
	 
	        try {
	             String redirectUri = oAuth2Parameters.getRedirectUri();
	            System.out.println("Redirect URI : " + redirectUri);
	            System.out.println("Code : " + code);
	 
	            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
	            String accessToken = accessGrant.getAccessToken();
	            System.out.println("AccessToken: " + accessToken);
	            Long expireTime = accessGrant.getExpireTime();
	        
	            
	            if (expireTime != null && expireTime < System.currentTimeMillis()) {
	                accessToken = accessGrant.getRefreshToken();
	               // logger.info("accessToken is expired. refresh token = {}", accessToken);
	            };
	            
	        
	            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
	            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
	            UserOperations userOperations = facebook.userOperations();
	            
	            
	            
	            try
	 
	            {            
	                String [] fields = { "id", "email",  "name"};
	                User userProfile = facebook.fetchObject("me", User.class, fields);
	                System.out.println("유저이메일 : " + userProfile.getEmail());
	                System.out.println("유저 id : " + userProfile.getId());
	                System.out.println("유저 name : " + userProfile.getName());
	                
	                String snsId = userProfile.getId();
	                
	                HashMap<String,Object> snsInfo = new HashMap<String,Object>();
	                snsInfo.put("platForm", "facebook");
	                snsInfo.put("snsId", snsId);
	                
	                
	               Member result = ms.selectSnsChceck(snsInfo);
	               	System.out.println(result);
	               
	               	if(result == null){
	                	m.setEmail(userProfile.getEmail());
	                	m.setNickname(userProfile.getName());
	                	m.setSnsId(snsId);
	                	
	                	int facebokLogin = ms.insertFacebook(m);
	                	
	                	if(facebokLogin >0){
	                		int mid = ms.selectMemberSequence();
	                		model.addAttribute("mid", mid);
	                		return "member/addUserInfo";
	                	}
	                	
	                	
	                }else{
	                	model.addAttribute("loginUser", result);
	        			System.out.println("로그인 성공");
	                	return "main/mainHotel";
	                }
	                
	                
	                
	                
	            } catch (MissingAuthorizationException e) {
	                e.printStackTrace();
	            }
	 
	        
	        } catch (Exception e) {
	 
	            e.printStackTrace();
	 
	        }
	        return "main/mainHotel";
	    }
	
	 
	// 회원 가입 페이지
    @RequestMapping(value = "google.me", method = { RequestMethod.GET, RequestMethod.POST })
    public void join(HttpServletResponse response, Model model) {
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        String googleUrl = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        
        ObjectMapper mapper = new ObjectMapper();
        try {
			response.getWriter().println(mapper.writeValueAsString(googleUrl));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //model.addAttribute("google_url", url);
        System.out.println("/googleLogin, url : " + googleUrl);
 
        //return "common/menubar";
    }
    @RequestMapping(value = "googleSignInCallback.me", method = { RequestMethod.GET, RequestMethod.POST })
    public String doSessionAssignActionPage(HttpServletRequest request,Member m, Model model) throws Exception {
 
        String code = request.getParameter("code");
 
        oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
                null);
 
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
 
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
            
        }
 
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        System.out.println(connection);
 
        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();
        System.out.println("User Uid : " + profile.getId());
        System.out.println("User Name : " + profile.getDisplayName());
        System.out.println("User Email : " + profile.getAccountEmail());
        System.out.println("User Profile : " + profile.getImageUrl());
        System.out.println(profile.getEmailAddresses());
        
        String snsId = profile.getId();
        
        HashMap<String,Object> snsInfo = new HashMap<String,Object>();
        snsInfo.put("platForm", "google");
        snsInfo.put("snsId", snsId);
        
        Member result = ms.selectSnsChceck(snsInfo);
        
        if(result ==null){
        	m.setSnsId(snsId);
        	m.setNickname(profile.getDisplayName());
        	m.setEmail(profile.getAccountEmail());
        	
        	int googleLoigin = ms.insertGoogole(m);
        	
        	if(googleLoigin >0){
        		int mid = ms.selectMemberSequence();
        		model.addAttribute("mid", mid);
        		return "member/addUserInfo";
        	}
        }else{
        	model.addAttribute("loginUser", result);
			System.out.println("로그인 성공");
        	return "main/mainHotel";
        }
        
        // Access Token 취소
        try {
            System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
        } catch (Exception e) {
 
            e.printStackTrace();
        }
        return "main/mainHotel";
 
    }
	
    //닉네임중복확인
    @RequestMapping("nicknameCheck.me")
    public void nicknameCheck(String nickname, HttpServletResponse response){
    	System.out.println(nickname);
    	int result = ms.nicknameCheck(nickname);
    	System.out.println("result"+result);
    	 ObjectMapper mapper = new ObjectMapper();
    	 
    	 try {
			response.getWriter().println(mapper.writeValueAsString(result));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    //email중복체크
    @RequestMapping(value="emailCheck.me")
    public void emailCheck(String email,HttpServletResponse response){
    	System.out.println(email);
    	int result =ms.emailCheck(email);
    	
    	ObjectMapper mapper = new ObjectMapper();
    	try {
			response.getWriter().println(mapper.writeValueAsString(result));
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    
    


}