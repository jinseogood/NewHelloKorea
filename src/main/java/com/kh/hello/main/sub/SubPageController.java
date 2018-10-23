package com.kh.hello.main.sub;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hello.board.model.service.BoardService;
import com.kh.hello.board.model.vo.Board;
import com.kh.hello.board.model.vo.Reply;
import com.kh.hello.common.PageInfo;
import com.kh.hello.common.Pagination2;
 


@Controller
public class SubPageController {
	
	@Autowired
	private BoardService bs;

	@RequestMapping("aboutAreaHotel")
	public String aboutAreaHotel(){
		return "aboutArea/searchAreaHotel";
	}
	
	@RequestMapping("aboutAreaFood")
	public String aboutAreaFood(){
		return "aboutArea/searchAreaFood";
	}
	
	@RequestMapping("aboutAreaGame")
	public String aboutAreaGame(){
		return "aboutArea/searchAreaGame";
	}
	
	@RequestMapping("detailHotel")
	public String detailHotelView(Model model, PageInfo p/*, @RequestParam int contentid*/){
		
		//리뷰 페이징
		ArrayList<Board> list = null;
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		PageInfo pi = null;

		/*int listCount = bs.selectReviewCount();
		pi = Pagination2.getPageInfo(p.getCurrentPage(), listCount);
		list= bs.selectReview(pi);	
		
		if(list != null){
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("listCount", listCount);
		}*/
		
		//Q 페이징
		ArrayList<Board> list2 = null;
		
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		
		PageInfo pi2 = null;
		
		/*int listCount2 = bs.selectQCount();
		pi2 = Pagination2.getPageInfo(p.getCurrentPage(), listCount2);
		list2 = bs.selectQ(pi2);
		
		if(list2 != null){
			model.addAttribute("list2", list2);
			model.addAttribute("pi2", pi2);
			model.addAttribute("listCount2", listCount2);
		}*/
		
		ArrayList<Reply> listQAnswer = bs.selectQAnswer();
		
		model.addAttribute("listQAnswer", listQAnswer);
		
		//System.out.println(listQAnswer);

		return "aboutDetail/detailHotel";
	}
	
	@RequestMapping("detailFood")
	public String detailFoodView(){
		return "aboutDetail/detailFood";
	}
	
	@RequestMapping("detailGame")
	public String detailGameView(){
		return "aboutDetail/detailGame";
	}
	
	@RequestMapping("themeMain")
	public String themeMainView(){
		return "themeTour/themeTourMain";
	}
	
	@RequestMapping("themeDetail")
	public String themeDetailView(){
		return "themeTour/themeTourDetail";
	}
	
	

}
