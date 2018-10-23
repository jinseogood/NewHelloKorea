package com.kh.hello.message.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.admin.model.vo.Reservation;
import com.kh.hello.common.PageInfo;
import com.kh.hello.message.model.vo.Message;
@Repository
public class MessageDaoImpl implements MessageDao{

	//받은 메세지 페이징
	@Override
	public int getReceiveMessageCount(SqlSessionTemplate sqlSession, String mId) {
		return sqlSession.selectOne("getReceiveMessageCount", Integer.parseInt(mId));
	}

	//받은 메세지 select
	@Override
	public ArrayList<Message> selectReceiveMessage(SqlSessionTemplate sqlSession, String mId, PageInfo pi) {
		ArrayList<Message> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectReceiveMessage", Integer.parseInt(mId), rowBounds);
		return list;
	}

	//메세지 읽은 날짜 추가
	@Override
	public int updateMessageReadDate(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.update("updateMessageReadDate",Integer.parseInt(msgId));
	}
	
	//받은 메세지 detail
	@Override
	public Message selectReceiveMessageDetail(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.selectOne("selectReceiveMessageDetail", Integer.parseInt(msgId));
	}

	//받은 메세지 삭제
	@Override
	public int updateMessageStatus(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.update("updateMessageStatus", Integer.parseInt(msgId));
	}

	//보낸 메세지 페이징
	@Override
	public int getSendMessageCount(SqlSessionTemplate sqlSession, int sendId) {
		return sqlSession.selectOne("getSendMessageCount", sendId);
	}
	
    //보낸메세지함
	@Override
	public ArrayList<Message> selectSendMessage(SqlSessionTemplate sqlSession, int sendId, PageInfo pi) {
		ArrayList<Message> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("selectSendMessage", sendId, rowBounds);
		return list;
	}

	//메세지 답장(발송)
	@Override
	public int sendMessage(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("sendMessage", m);
	}

	//문의 발송
	@Override
	public int insertQuestion(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("insertQuestion", m);
	}

	//보낸 메세지 상세
	@Override
	public Message selectSendMessageDetail(SqlSessionTemplate sqlSession, String msgId) {
		return sqlSession.selectOne("selectSendMessageDetail", Integer.parseInt(msgId));
	}

	//메뉴바 새 메세지 여부
	@Override
	public ArrayList<Message> checkNewMessage(SqlSessionTemplate sqlSession, String mId) {
		return (ArrayList)sqlSession.selectList("selectNewMessage", Integer.parseInt(mId));
	}


	
}
