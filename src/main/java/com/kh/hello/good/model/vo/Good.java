package com.kh.hello.good.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Good implements Serializable{
	
	private int lid;			//찜번호
	private String lType;		//구분
	private int originId;		//고유아이디
	private int mid;			//회원아이디
	private int cid;			//업체아이디

	public Good(){}

	public Good(int lid, String lType, int originId, int mid, int cid) {
		super();
		this.lid = lid;
		this.lType = lType;
		this.originId = originId;
		this.mid = mid;
		this.cid = cid;
	}


	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getlType() {
		return lType;
	}

	public void setlType(String lType) {
		this.lType = lType;
	}

	public int getOriginId() {
		return originId;
	}

	public void setOriginId(int originId) {
		this.originId = originId;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Good [lid=" + lid + ", lType=" + lType + ", originId=" + originId + ", mid=" + mid + ", cid=" + cid
				+ "]";
	}

	
	

}
