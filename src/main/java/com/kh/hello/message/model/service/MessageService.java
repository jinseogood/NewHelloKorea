package com.kh.hello.message.model.service;

import java.util.ArrayList;

import com.kh.hello.common.PageInfo;
import com.kh.hello.message.model.vo.Message;

public interface MessageService {

	int getReceiveMessageCount(String mId);
	ArrayList<Message> selectReceiveMessage(String mId, PageInfo pi);
	int updateMessageReadDate(String msgId);
	Message selectReceiveMessageDetail(String msgId);
	int updateMessageStatus(String msgId);
	int getSendMessageCount(int sendId);
	ArrayList<Message> selectSendMessage(int sendId, PageInfo pi);
	int sendMessage(Message m);
	int insertQuestion(Message m);
	Message selectSendMessageDetail(String msgId);
	ArrayList<Message> checkNewMessage(String mId);


}
