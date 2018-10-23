package com.kh.hello.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hello.common.PageInfo;
import com.kh.hello.message.dao.MessageDao;
import com.kh.hello.message.model.vo.Message;
@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDao md;
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	//받은 메세지함 페이징
	@Override
	public int getReceiveMessageCount(String mId) {
		return md.getReceiveMessageCount(sqlSession, mId);
	}

	//받은 메세지함 select
	@Override
	public ArrayList<Message> selectReceiveMessage(String mId, PageInfo pi) {
		return md.selectReceiveMessage(sqlSession, mId, pi);
	}

	//메세지 읽은 날짜 추가
	@Override
	public int updateMessageReadDate(String msgId) {
		return md.updateMessageReadDate(sqlSession, msgId);
	}
	//받은 메세지 detail
	@Override
	public Message selectReceiveMessageDetail(String msgId) {
		return md.selectReceiveMessageDetail(sqlSession, msgId);
	}
	
	//받은 메세지 삭제
	@Override
	public int updateMessageStatus(String msgId) {
		return md.updateMessageStatus(sqlSession, msgId);
	}

	//보낸 메세지함 페이징
	@Override
	public int getSendMessageCount(int sendId) {
		return md.getSendMessageCount(sqlSession, sendId);
	}

	//보낸 메세지함 select
	@Override
	public ArrayList<Message> selectSendMessage(int sendId, PageInfo pi) {
		return md.selectSendMessage(sqlSession, sendId, pi);
	}

	//메세지 답장(발송)
	@Override
	public int sendMessage(Message m) {
		return md.sendMessage(sqlSession, m);
	}

	//문의 발송
	@Override
	public int insertQuestion(Message m) {
		return md.insertQuestion(sqlSession, m);
	}

	//보낸 메세지 상세
	@Override
	public Message selectSendMessageDetail(String msgId) {
		return md.selectSendMessageDetail(sqlSession, msgId);
	}

	//메뉴바 새메세지 여부
	@Override
	public ArrayList<Message> checkNewMessage(String mId) {
		return md.checkNewMessage(sqlSession, mId);
	}


}
