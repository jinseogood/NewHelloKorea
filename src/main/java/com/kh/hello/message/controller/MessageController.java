package com.kh.hello.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hello.common.PageInfo;
import com.kh.hello.common.Pagination;
import com.kh.hello.message.model.service.MessageService;
import com.kh.hello.message.model.vo.Message;
@Controller
public class MessageController {
	@Autowired
	MessageService ms;
	
	//받은 메세지함
	@RequestMapping("receiveMessageView")
	public String receiveMessageView(String mId, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		int listCount = ms.getReceiveMessageCount(mId);
		PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
		ArrayList<Message> list = ms.selectReceiveMessage(mId, pi); 
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "message/receiveMessage";
	}
	
	//받은 메세지 디테일
	@RequestMapping("receiveDetailView")
	public String receiveDetailView(String msgId, String pDate, Model model){
		if(pDate.equals("미처리")||pDate.equals("읽지 않음")){
			int result = ms.updateMessageReadDate(msgId);
			
			if(result > 0){
				Message m = ms.selectReceiveMessageDetail(msgId);
				model.addAttribute("m", m);
				return "message/receiveDetail";
			}else{
				model.addAttribute("msg","메세지 상세 페이지 실패");
				return "common/errorPage";
			}
		}
		Message m = ms.selectReceiveMessageDetail(msgId);
		model.addAttribute("m", m);
		return "message/receiveDetail";
	}
	
	//메세지 삭제
	@RequestMapping("deleteMessage")
	public String deleteMessage(String msgId, String mId, Model model){
		int result = ms.updateMessageStatus(msgId);
		if(result > 0){
			
			int listCount = ms.getReceiveMessageCount(mId);
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Message> list = ms.selectReceiveMessage(mId, pi); 
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "message/receiveMessage";
		}else{
			model.addAttribute("msg","메세지 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	//답장 화면
	@RequestMapping("sendView")
	public String sendView(String receiveId, String nickname, String mId, Model model){
		model.addAttribute("mId", mId);
		model.addAttribute("receiveId", receiveId);
		model.addAttribute("nickname", nickname);
		return "message/send";
	}
	
	//답장 보내기
	@RequestMapping("sendMessage")
	public String sendMessage(Message m, Model model){
		int result = ms.sendMessage(m);
		if(result > 0){
			int listCount = ms.getSendMessageCount(m.getSendId());
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Message> list = ms.selectSendMessage(m.getSendId(), pi);
			model.addAttribute("mId",m.getSendId());
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "message/sendMessage";
		}else{
			model.addAttribute("msg","메세지 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	//보낸 메세지함
	@RequestMapping("sendMessageView")
	public String sendMessageView(String mId, PageInfo p, Model model){
		if(p.getCurrentPage() == 0){
			p.setCurrentPage(1);
		}
		int listCount = ms.getSendMessageCount(Integer.parseInt(mId));
		PageInfo pi = Pagination.getPageInfo(p.getCurrentPage(), listCount);		
		ArrayList<Message> list = ms.selectSendMessage(Integer.parseInt(mId), pi);
		model.addAttribute("mId",mId);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "message/sendMessage";
	}
	
	//보낸 메세지 상세
	@RequestMapping("sendDetailView")
	public String sendDatailView(String msgId, Model model){
		Message m = ms.selectSendMessageDetail(msgId);
		model.addAttribute("m", m);				
		return "message/sendDetail";
	}
	
	//문의하기 창
	@RequestMapping("sendQuestionView")
	public String sendQuestionView(String mId, Model model){
		model.addAttribute("mId", mId);	
		return "message/sendQuestion";
	}
	
	//문의 전송
	@RequestMapping("insertQuestion")
	public String insertQuestion(Message m, Model model){
		int result = ms.insertQuestion(m);
		if(result > 0){
			int listCount = ms.getSendMessageCount(m.getSendId());
			PageInfo pi = Pagination.getPageInfo(1, listCount);		
			ArrayList<Message> list = ms.selectSendMessage(m.getSendId(), pi); 
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "message/sendMessage"; 
		}else{
			model.addAttribute("msg","문의 전송 실패");
			return "common/errorPage";
		}
		
	}
	
	//새로온 메세지가 있는지 여부
	@RequestMapping("checkNewMessage")
	public @ResponseBody HashMap<String, Object> checkNewMessage(@RequestParam String mId, Model model){
		ArrayList<Message> m = ms.checkNewMessage(mId);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		if(m.size() != 0){
			hmap.put("newMessage", "Y");
		}else{
			hmap.put("newMessage", "N");
		}
		//System.out.println(m);
		return hmap;
	}
}
