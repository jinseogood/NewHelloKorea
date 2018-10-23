package com.kh.hello.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Board implements java.io.Serializable{
	private int bid;
	private String title;
	private String text;
	private int board_type;
	private String regist_date;
	private String status;
	private String modify_date;
	private float grade;
	private int likey;
	private int m_id;
	private int origin_id;
	private String travel_date;
	private int rCount;
	private String national;
	private String nickname;
	private String interesting;
	private int help_count;
	private int board_count;
	private int reply_count;
	private String attach;
	private String create_date;
	private String email;
	
	public Board(){}
	
	

	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id, String travel_date, int rCount,
			String national, String nickname, String interesting, int help_count, int board_count, int reply_count,
			String attach, String create_date, String email) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
		this.origin_id = origin_id;
		this.travel_date = travel_date;
		this.rCount = rCount;
		this.national = national;
		this.nickname = nickname;
		this.interesting = interesting;
		this.help_count = help_count;
		this.board_count = board_count;
		this.reply_count = reply_count;
		this.attach = attach;
		this.create_date = create_date;
		this.email = email;
	}



	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id, String travel_date, int rCount,
			String national, String nickname, String interesting, int help_count, int board_count, int reply_count,
			String attach, String create_date) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
		this.origin_id = origin_id;
		this.travel_date = travel_date;
		this.rCount = rCount;
		this.national = national;
		this.nickname = nickname;
		this.interesting = interesting;
		this.help_count = help_count;
		this.board_count = board_count;
		this.reply_count = reply_count;
		this.attach = attach;
		this.create_date = create_date;
	}







	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id, String travel_date, int rCount) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
		this.origin_id = origin_id;
		this.travel_date = travel_date;
		this.rCount = rCount;
	}

	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id, String travel_date) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
		this.origin_id = origin_id;
		this.travel_date = travel_date;
	}



	public Board(int bid, String title, String text, int board_type, String regist_date, String status, String modify_date,
			float grade, int likey, int m_id) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public String getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getOrigin_id() {
		return origin_id;
	}

	public void setOrigin_id(int origin_id) {
		this.origin_id = origin_id;
	}

	public Board(int bid, String title, String text, int board_type, String regist_date, String status,
			String modify_date, float grade, int likey, int m_id, int origin_id) {
		super();
		this.bid = bid;
		this.title = title;
		this.text = text;
		this.board_type = board_type;
		this.regist_date = regist_date;
		this.status = status;
		this.modify_date = modify_date;
		this.grade = grade;
		this.likey = likey;
		this.m_id = m_id;
		this.origin_id = origin_id;
	}
	
	

	public String getTravel_date() {
		return travel_date;
	}

	public void setTravel_date(String travel_date) {
		this.travel_date = travel_date;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getInteresting() {
		return interesting;
	}

	public void setInteresting(String interesting) {
		this.interesting = interesting;
	}

	public int getHelp_count() {
		return help_count;
	}

	public void setHelp_count(int help_count) {
		this.help_count = help_count;
	}


	public String getAttach() {
		return attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	
	



	public int getBoard_count() {
		return board_count;
	}



	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}



	public int getReply_count() {
		return reply_count;
	}



	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "Board [bid=" + bid + ", title=" + title + ", text=" + text + ", board_type=" + board_type
				+ ", regist_date=" + regist_date + ", status=" + status + ", modify_date=" + modify_date + ", grade="
				+ grade + ", likey=" + likey + ", m_id=" + m_id + ", origin_id=" + origin_id + ", travel_date="
				+ travel_date + ", rCount=" + rCount + ", national=" + national + ", nickname=" + nickname
				+ ", interesting=" + interesting + ", help_count=" + help_count + ", board_count=" + board_count
				+ ", reply_count=" + reply_count + ", attach=" + attach + ", create_date=" + create_date + ", email="
				+ email + "]";
	}



	



	
	
}
