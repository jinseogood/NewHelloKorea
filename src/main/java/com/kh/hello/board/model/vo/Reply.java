package com.kh.hello.board.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class Reply implements java.io.Serializable{
	private int reply_id;
	private String content;
	private String regist_date;
	private String modify_date;
	private String regist_status;
	private int help_point;
	private int m_id;
	private int bid;
	private String email;
	private String nickname;
	
	public Reply(){}

	public Reply(int reply_id, String content, String regist_date, String modify_date, String regist_status,
			int help_point, int m_id, int bid, String email, String nickname) {
		super();
		this.reply_id = reply_id;
		this.content = content;
		this.regist_date = regist_date;
		this.modify_date = modify_date;
		this.regist_status = regist_status;
		this.help_point = help_point;
		this.m_id = m_id;
		this.bid = bid;
		this.email = email;
		this.nickname = nickname;
	}



	public Reply(int reply_id, String content, String regist_date, String modify_date, String regist_status,
			int help_point, int m_id, int bid, String email) {
		super();
		this.reply_id = reply_id;
		this.content = content;
		this.regist_date = regist_date;
		this.modify_date = modify_date;
		this.regist_status = regist_status;
		this.help_point = help_point;
		this.m_id = m_id;
		this.bid = bid;
		this.email = email;
	}



	public Reply(int reply_id, String content, String regist_date, String modify_date, String regist_status,
			int help_point, int m_id, int bid) {
		super();
		this.reply_id = reply_id;
		this.content = content;
		this.regist_date = regist_date;
		this.modify_date = modify_date;
		this.regist_status = regist_status;
		this.help_point = help_point;
		this.m_id = m_id;
		this.bid = bid;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public String getRegist_status() {
		return regist_status;
	}

	public void setRegist_status(String regist_status) {
		this.regist_status = regist_status;
	}

	public int getHelp_point() {
		return help_point;
	}

	public void setHelp_point(int help_point) {
		this.help_point = help_point;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Reply [reply_id=" + reply_id + ", content=" + content + ", regist_date=" + regist_date
				+ ", modify_date=" + modify_date + ", regist_status=" + regist_status + ", help_point=" + help_point
				+ ", m_id=" + m_id + ", bid=" + bid + ", email=" + email + ", nickname=" + nickname + "]";
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
