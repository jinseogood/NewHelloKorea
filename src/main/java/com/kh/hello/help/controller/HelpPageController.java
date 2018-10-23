package com.kh.hello.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpPageController {
	@RequestMapping("helpView")
	public String helpView(){
		return "help/helpPage";
	}
	
	@RequestMapping("g_reviewWrite1")
	public String g_reviewWrite1(){
		return "help/g_reviewWrite1";
	}
	
	@RequestMapping("g_reviewWrite2")
	public String g_reviewWrite2(){
		return "help/g_reviewWrite2";
	}
	
	@RequestMapping("g_reviewWrite3")
	public String g_reviewWrite3(){
		return "help/g_reviewWrite3";
	}
	
	@RequestMapping("g_reviewAnswer1")
	public String g_reviewAnswer1(){
		return "help/g_reviewAnswer1";
	}
	
	@RequestMapping("g_reviewAnswer2")
	public String g_reviewAnswer2(){
		return "help/g_reviewAnswer2";
	}
	
	@RequestMapping("g_reviewAnswer3")
	public String g_reviewAnswer3(){
		return "help/g_reviewAnswer3";
	}
	
	@RequestMapping("g_listingGuide1")
	public String g_listingGuide1(){
		return "help/g_listingGuide1";
	}
	
	@RequestMapping("g_listingGuide2")
	public String g_listingGuide2(){
		return "help/g_listingGuide2";
	}
	
	@RequestMapping("g_listingGuide3")
	public String g_listingGuide3(){
		return "help/g_listingGuide3";
	}
	
	@RequestMapping("g_listingControll1")
	public String g_listingControll1(){
		return "help/g_listingControll1";
	}
	
	@RequestMapping("g_listingControll2")
	public String g_listingControll2(){
		return "help/g_listingControll2";
	}
	
	@RequestMapping("g_listingControll3")
	public String g_listingControll3(){
		return "help/g_listingControll3";
	}
	
	@RequestMapping("g_cheat1")
	public String g_cheat1(){
		return "help/g_cheat1";
	}
	
	@RequestMapping("g_cheat2")
	public String g_cheat2(){
		return "help/g_cheat2";
	}
	
	@RequestMapping("g_cheat3")
	public String g_cheat3(){
		return "help/g_cheat3";
	}
	
	@RequestMapping("g_etcGuide1")
	public String g_etcGuide1(){
		return "help/g_etcGuide1";
	}
	
	@RequestMapping("g_etcGuide2")
	public String g_etcGuide2(){
		return "help/g_etcGuide2";
	}
	
	@RequestMapping("g_etcGuide3")
	public String g_etcGuide3(){
		return "help/g_etcGuide3";
	}
	
	@RequestMapping("s_start1")
	public String s_start1(){
		return "help/s_start1";
	}
	
	@RequestMapping("s_start2")
	public String s_start2(){
		return "help/s_start2";
	}
	
	@RequestMapping("s_start3")
	public String s_start3(){
		return "help/s_start3";
	}
	
	@RequestMapping("c_memberCenter1")
	public String c_memberCenter1(){
		return "help/c_memberCenter1";
	}
	
	@RequestMapping("c_memberCenter2")
	public String c_memberCenter2(){
		return "help/c_memberCenter2";
	}
	
	@RequestMapping("c_memberCenter3")
	public String c_memberCenter3(){
		return "help/c_memberCenter3";
	}
	
	@RequestMapping("t_id1")
	public String t_id1(){
		return "help/t_id1";
	}
	
	@RequestMapping("t_id2")
	public String t_id2(){
		return "help/t_id2";
	}
	
	@RequestMapping("t_id3")
	public String t_id3(){
		return "help/t_id3";
	}
}
