package com.kh.hello.message.model.vo;


import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Message implements java.io.Serializable{
	private int msgId;
	private int receiveId;
	private int sendId;
	private String title;
	private String content;
	private Date sendDate;
	private Date readDate;
	private String status;
	private String mLevel;
	private Date pDate;
	private String nickname;
	
	public Message(){}

	public Message(int msgId, int receiveId, int sendId, String title, String content, Date sendDate, Date readDate,
			String status, String mLevel, Date pDate, String nickname) {
		super();
		this.msgId = msgId;
		this.receiveId = receiveId;
		this.sendId = sendId;
		this.title = title;
		this.content = content;
		this.sendDate = sendDate;
		this.readDate = readDate;
		this.status = status;
		this.mLevel = mLevel;
		this.pDate = pDate;
		this.nickname = nickname;
	}

	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}

	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Date getReadDate() {
		return readDate;
	}

	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getmLevel() {
		return mLevel;
	}

	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Message [msgId=" + msgId + ", receiveId=" + receiveId + ", sendId=" + sendId + ", title=" + title
				+ ", content=" + content + ", sendDate=" + sendDate + ", readDate=" + readDate + ", status=" + status
				+ ", mLevel=" + mLevel + ", pDate=" + pDate + ", nickname=" + nickname + "]";
	}

	
	
}
