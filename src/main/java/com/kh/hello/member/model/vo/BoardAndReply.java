package com.kh.hello.member.model.vo;

import org.springframework.stereotype.Repository;

@Repository
public class BoardAndReply implements java.io.Serializable {
	private int bId;
	private String title;
	private int boardType;
	private int likey;
	private int mId;
	private String modifyDate;
	private int rCount;
	
	
	public BoardAndReply(){}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public int getLikey() {
		return likey;
	}


	public void setLikey(int likey) {
		this.likey = likey;
	}


	public int getmId() {
		return mId;
	}


	public void setmId(int mId) {
		this.mId = mId;
	}


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getrCount() {
		return rCount;
	}


	public void setrCount(int rCount) {
		this.rCount = rCount;
	}


	public BoardAndReply(int bId, String title, int boardType, int likey, int mId, String modifyDate, int rCount) {
		super();
		this.bId = bId;
		this.title = title;
		this.boardType = boardType;
		this.likey = likey;
		this.mId = mId;
		this.modifyDate = modifyDate;
		this.rCount = rCount;
	}


	@Override
	public String toString() {
		return "BoardAndReply [bId=" + bId + ", title=" + title + ", boardType=" + boardType + ", likey=" + likey
				+ ", mId=" + mId + ", modifyDate=" + modifyDate + ", rCount=" + rCount + "]";
	}
	
	
	
	
	
}
