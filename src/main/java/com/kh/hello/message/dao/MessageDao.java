package com.kh.hello.message.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.hello.common.PageInfo;
import com.kh.hello.message.model.vo.Message;

public interface MessageDao {

	int getReceiveMessageCount(SqlSessionTemplate sqlSession, String mId);
	ArrayList<Message> selectReceiveMessage(SqlSessionTemplate sqlSession, String mId, PageInfo pi);
	int updateMessageReadDate(SqlSessionTemplate sqlSession, String msgId);
	Message selectReceiveMessageDetail(SqlSessionTemplate sqlSession, String msgId);
	int updateMessageStatus(SqlSessionTemplate sqlSession, String msgId);
	int getSendMessageCount(SqlSessionTemplate sqlSession, int sendId);
	ArrayList<Message> selectSendMessage(SqlSessionTemplate sqlSession, int sendId, PageInfo pi);
	int sendMessage(SqlSessionTemplate sqlSession, Message m);
	int insertQuestion(SqlSessionTemplate sqlSession, Message m);
	Message selectSendMessageDetail(SqlSessionTemplate sqlSession, String msgId);
	ArrayList<Message> checkNewMessage(SqlSessionTemplate sqlSession, String mId);

}
